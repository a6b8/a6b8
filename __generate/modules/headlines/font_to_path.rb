require 'uri'
require 'net/http'
require 'json'
require 'pp'
require 'zip/zip'
require 'text2svg'
require 'nokogiri'

module FontToPath
    class SVG
        attr_reader :code, :config
        attr_writer :config

        def initialize( config: )
            @config = config
        end


        def convert( text: )
            svg = Text2svg( 
                text, 
                font: @config[:format][:font_path], 
                text_align: @config[:format][:text_align].to_sym, 
                bold: @config[:format][:bold]
            ).to_s
        
            elements = self.svg_elements( svg: svg )
            items = self.svg_items_decode( text: text, elements: elements, config: @config )
            @code = self.svg_create_code( items: items, svg: svg, offset_height: 5 )

            return @code
        end


        private


        def svg_elements( svg: )
            svg = svg[ svg.index( '<path transform' ), svg.length ]
            svg = svg[ 0, svg.rindex( "\n</g>\n</svg>\n" ) ]
            elements = []
            found = true

            while found
                to = '/>'
                element = svg[ 0, svg.index( to ) + to.length ].strip
                elements.push( element )
                svg = svg[ svg.index( to ) + to.length, svg.length ]
                !svg.include?( 'path' ) ? found = false : ''
            end

            return elements
        end


        def svg_items_decode( text:, elements:, config: )
            def svg_item( element:, config: )
                item = {
                    "character": nil,
                    "fill": nil,
                    "fill-opacity": nil,
                    "stroke": nil,
                    "stroke-width": nil,
                    "stroke-linecap": nil,
                    "stroke-opacity": nil,
                    "transform": nil,
                    "d": nil
                }
    
                item[:"character"] = config[:char]
                item[:"fill"] = config[:fill][:color]
                item[:"fill-opacity"] = config[:fill][:opacity]
                item[:"stroke"] = config[:stroke][:color]
                item[:"stroke-width"] = config[:stroke][:width]
                item[:"stroke-linecap"] = config[:stroke][:linecap]
                item[:"stroke-opacity"] = config[:stroke][:opacity]
            
                [ :"transform", :"d" ].each do | key |
                    search = key.to_s
                    doc = Nokogiri::XML( element )
                    item[ key ] = doc
                        .xpath( "//*[@#{search}]" )[ 0 ]
                        .attribute( search )
                        .to_s
                end
    
                return item
            end
            
            
            characters = text.gsub( ' ', '' )
            items = []
    
            elements.each.with_index do | element, index |    
                c = Marshal.load( Marshal.dump( config ) )
                c[:char] = characters[ index ]
                item = self.svg_item( element: element, config: c )
                items.push( item )
            end

            return items
        end


        def svg_header( items:, svg:, offset_height: )
            element = svg[ 0, svg.index( "<path transform" ) ]
            search = 'viewBox'
            doc = Nokogiri::XML( element )
            values = doc.xpath("//*[@#{search}]")[ 0 ].attribute( search ).to_s
            values_mod = values.split( ' ' ).map { | a | a.to_i }
            values_mod[ 3 ] = values_mod[ 3 ] + offset_height
            from = "viewBox=\"#{values}\""
            to = "viewBox=\"#{values_mod.join(' ')}\""
            element = element.gsub( from, to )

            return element
        end


        def svg_create_code( items:, svg:, offset_height: )
            element = items.map do | item | 
                p = ''
                p += "\t\t<path "
                p += item.map { | c | "#{c[ 0 ]}=\"#{c[ 1 ]}\"" }.join( ' ' ) 
                p += '/>'
            end
        
            element = element.join( "\n" )
        
            code = ''
            code += self.svg_header( items: items, svg: svg, offset_height: offset_height )
            code += element.to_s
            code += "\n</g>\n</svg>"

            return code
        end
    end


    class Font
        attr_reader :config

        def initialize( font_name:, silent: false )
            @config = {
                font_name: nil,
                color: nil,
                stroke: nil,
                font_path: nil
            }

            @config[:font_name] = font_name.to_s
            @config[:font_path] = "./#{@config[:font_name]}-#{Time.now.getutc.to_i}.ttf"

            download( 
                font_name: @config[:font_name], 
                style: 'regular', 
                subset: 'latin', 
                font_path: @config[:font_path], 
                silent: silent
            )  
        end


        def clean_up
            File.delete( @config[:font_path] )
        end


        def download( font_name:, style:, subset:, font_path:, silent: )
            def str_difference( a, b )
                a = a.to_s.downcase.split( '_' ).join( '' )
                b = b.to_s.downcase.split( '_' ).join( '' )
                longer = [ a.size, b.size ].max
                same = a
                    .each_char
                    .zip( b.each_char )
                    .select { | a, b | a == b }
                    .size
                ( longer - same ) / a.size.to_f
            end


            def unzip_file( file, destination, file_name )
                Zip::ZipFile.open( file ) do | zip_file |
                    zip_file.each do | f |
                        f_path = File.join( destination, file_name )  
                        FileUtils.mkdir_p( File.dirname( f_path ) )
                        zip_file.extract( f, f_path ) unless File.exist?( f_path )
                    end
                end
            end

            item = {
                server: 'https://google-webfonts-helper.herokuapp.com',
                url: nil,
                fonts: {
                    all: [],
                    subsets: []
                },
                search: {
                    name: font_name.to_s,
                    style: style.to_s,
                    subset: subset.to_s
                },
                found: {
                    id: nil,
                    name: nil,
                    subset: nil,
                    variant: nil,
                    url: nil
                }
            }

            item[:url] = "#{item[:server]}/api/fonts"

            uri = URI( item[:url] )
            response = Net::HTTP.get( uri )
            item[:fonts][:all] = JSON.parse( response )

            item[:fonts][:subsets] = item[:fonts][:all]
                .select { | a | a['subsets'].include?( item[:search][:subset] ) }
        
            item[:found][:name] = item[:fonts][:subsets]
                .map { | a | 
                    { 
                        name: a['id'], 
                        score: str_difference( item[:search][:name], a['id'] ) 
                    } 
                }
                .min_by { | h | h[:score] }[:name]
        
            tmp = item[:fonts][:subsets]
                .find { | a | a['id'].eql?( item[:found][:name] ) }
            
            item[:found][:id] = tmp['id']
            item[:found][:variant] = tmp['variants']
                .map { | a | 
                    { 
                        name: a, 
                        score: str_difference( item[:search][:style], a.to_s ) 
                    } 
                }
                .min_by { | h | h[:score] }[:name]

            !silent ? print( "#{item[:found][:id]} #{item[:found][:variant]} #{item[:search][:subset]} (Google Fonts)" ) : ''
            
            item[:found][:url] = "#{item[:server]}/api/fonts/#{item[:found][:name]}?download=zip&subsets=#{item[:search][:subset]}&formats=ttf&variants=#{item[:found][:variant]}"
        
            uri = URI( item[:found][:url] )
            response = Net::HTTP.get( uri )
            path_zip = "./tmp-#{Time.now.getutc.to_i}.zip"
            
            File.open( path_zip, 'w' ) { | f | f.write( response ) }
            unzip_file( path_zip, File.dirname( path_zip ), font_path )

            File.delete( path_zip )
            return true
        end
    end
end