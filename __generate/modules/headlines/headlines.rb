module Headlines
    @@tabs
    @@config

    def self.generate( struct:, silent: true )
        @@tabs = '      '
        config = JSON
            .parse( open( struct ).read )
            .with_indifferent_access

        path_root = File.expand_path( '..', Dir.pwd )
        path_docs = "#{path_root}/docs/"
        
        readmes = []
        selector = config[:meta][:image][:selector]

        gh_user = config['meta']['github_user']
        markdowns = config['projects'].map do | project |
            gh_repo = project['github']
            str = "https://raw.githubusercontent.com/#{gh_user}/#{gh_repo}/main/README.md"
        end

        for index in 0..markdowns.length-1
            a = Markdown::Readme.new()
            readme = a.images( urls: markdowns, index: index, selector: selector )
            readmes.push( readme )
        end

        #puts readmes.pretty_inspect

        headline = nil
        default = nil

        config[:style].each do | key, value |
            font = config[:style][ key ][:font]

            case key
            when 'custom'
                headline = FontToPath::Font.new( font_name: font, silent: true )
            when 'default'
                default = FontToPath::Font.new( font_name: font, silent: true )
            else
                puts  'Font not found.'
            end
        end


        r1 = self.font_types( readmes: readmes, config: config, silent: silent, headline: headline, default: default )
        r2 = self.print_headers( readmes: readmes, silent: silent )
        r3 = self.inspect_text( readmes: readmes, silent: silent )

        headline.clean_up
        default.clean_up

        results = [ 
            { font_type: r1 }, 
            { header: r2 }, 
            { headline_order: r3 } 
        ]

        return results
    end


    def self.font_types( readmes:, config:, silent:, headline:, default: )
        l = readmes.map { | readme | readme[:folder].length }.max + 5
        items = []

        str = "NR   NAME"
        space = ( l - 4 ).times.map { | a | ' ' }.join( '' )
        !silent ? puts( "#{@@tabs}#{str}#{space}OVERVIEW" ) : ''

        results = []
        readmes.each.with_index do | readme, index |
            readme[:headers][:items].each.with_index do | item, rindex |
                if rindex == 0 and !silent
                    space = ( 3 - index.to_s.length ).times.map { | a | ' ' }.join( '' )
                    !silent ? print( "#{@@tabs}[#{index}]#{space}" ) : ''
        
                    space = ( l - readme[:folder].length ).times.map { | a | ' ' }.join( '' )
                    !silent ? print( "#{readme[:folder]}#{space}" ) : ''
                end

                item[:folder] = readme[:folder]

                c = Marshal
                    .load( Marshal.dump( config[:style][ item[:type] ] ) )
                    .with_indifferent_access

                if item[:type].eql? :default
                    c['format']['font_path'] = default.config[:font_path]
                else
                    c['format']['font_path'] = headline.config[:font_path]
                end

                if rindex == 0
                    if !item[:type].eql? :default
                        results[ index ] = true
                    end
                else
                    if !item[:type].eql? :default
                        results[ index ] = false
                    end
                end

                svg = FontToPath::SVG.new( config: c )
                svg.convert( text: item[:text] )

                path = "#{Dir.pwd}/assets/headlines/"
                FileUtils.mkdir_p path

                case item[:type]
                when :default
                    path_svg = "#{path}default/#{item[:file_name]}.svg"
                when :custom
                    path_svg = "#{path}custom/#{item[:file_name]}.svg"
                else
                end
             
                File.open( path_svg, 'w' ) { | f | f.write( svg.code) }
                !silent ? print( config['style'][ item[:type].to_s ]['emoji'] ): ''
            end

            !silent ? puts : ''
        end

        if !silent
            puts 
            config['style'].keys.each do | key |
                puts "#{@@tabs}#{config['style'][ key ]['emoji']}  #{key[ 0, 1 ].upcase}#{key[ 1, key.length ]}"
            end
        end

        return results.all?
    end


    def self.print_headers( readmes:, silent: )
        l = readmes.map { | a | a[:folder].length }.max + 5
    
        !silent ? puts( "#{@@tabs}NR   NAME                                   IMAGES   HEADERS   ERRORS" )  : ''
        results = []
        readmes.each.with_index do | readme, index |
        
            space = ( 3 - index.to_s.length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{@@tabs}[#{index}]#{space}" ) : ''
        
            space = ( l - readme[:folder].length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{readme[:folder]}#{space}" ) : ''
        
            space = ( 3 - readme[:headers][:total].to_s.length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{space}#{readme[:headers][:total]}" ) : ''
        
            space = ( 10 - readme[:headers][:items].length.to_s.length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{space}#{readme[:headers][:items].length}" ) : ''
        
            space = ( 9 - readme[:headers][:messages].length.to_s.length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{space}#{readme[:headers][:messages].length}" ) : ''
        
            results.push( readme[:headers][:messages].length == 0 )

            !silent ? puts : ''
        end

        return results.all?
    end


    def self.inspect_text( readmes:, silent: )
        tests = [
            [ "Examples", "🟥" ],
            [ "Table Of Contents", "🟧" ],
            [ "Quickstart", "🟨" ],
            [ "Setup", "🟩" ],
            [ "Methods", "🟦" ],
            [ "Contributing", "🟪" ],
            [ "Limitations", "🔴" ],
            [ "Credits", "🟠" ],
            [ "License", "🟡" ],
            [ "Code Of Conduct", "🟢" ],
            [ "Star Us", "🔵" ]
        ]

        other = "⬜️"

        test1 = ( 0..3 ).to_a.map { | a | tests[ a][ 1 ] }.insert( 0, other )
        test2 = ( -4..-1 ).to_a.map { | a | tests[ a ][ 1 ] }
        results = []

        l = readmes.map { | a | a[:folder].length }.max + 5
        !silent ? puts( "#{@@tabs}NR   NAME" ) : ''
        readmes.each.with_index do | readme, index |

            space = ( 3 - index.to_s.length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{@@tabs}[#{index}]#{space}" ) : ''

            space = ( l - readme[:folder].length ).times.map { | a | ' ' }.join( '' )
            !silent ? print( "#{readme[:folder]}#{space}" ) : ''

            list = readmes[ index ][:headers][:items]
                .map { | a | a[:text] }

            # puts index
            
            structure = list.map.with_index do | search |
                # puts search.to_s
                f = tests.find { | a | a[ 0 ].eql? search }
                emj = f.nil? ? "#{other}" : "#{f[ 1 ]}"
                !silent ? print( emj ) : ''
                emj
            end

            r1 = test1 == structure.first( 5 )
            r2 = test2 == structure.last( 4 )
            result = [ r1, r2 ].all?

            space = ( 18 - structure.length ).times.to_a.map { | a | "⬛️" }.join( '' )

            !silent ? print( "   #{result ? "#{space}✅" : "#{space}❌"}" ) : ''
            results.push( result )

            !silent ? puts : ''
        end

        if !silent
            puts
            tests.each { | a | puts "#{@@tabs}#{a[1]}  #{a[0]}"}
            puts "#{@@tabs}#{other}  Other"
        end

        return results.all?
    end

end