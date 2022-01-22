require 'uri'
require 'net/http'
require 'nokogiri'


module Markdown
    class Readme
        attr_reader :cmds

        def initialize
            @doc = nil
            @cmds = []
            @url = nil
        end


        def images( urls:, index:, selector: )
            folder = urls[ index ]
                .split( 'https://raw.githubusercontent.com/a6b8/' )
                .last
                .split( '/' )
                .first

            load( url: urls[ index ] )

            headers = headers( 
                selector: selector, 
                silent: true, 
                insert: {}
            )
        
            results = {
                folder: folder,
                headers: headers
            }

            return results
        end


        def load( url: )
            @url = url
            uri = URI( @url )
            response = Net::HTTP.get( uri )
            doc = Nokogiri::HTML( response )
            @doc = doc

            return true
        end


        def headers( selector: 'alt', silent: false, insert: {} ) 
            messages = []
            images = @doc.xpath( '//img' )
            items = []

            images.each.with_index do | image, index |
                begin
                    item = {
                        'text': nil,
                        'type': nil,
                        'file_name': nil,
                        'url': @url
                    }

                    insert.each { | k, v | item[ k ] = v }

                    keys = image.attributes.to_a.map { | a | a[ 0 ] }
                    tests = [ false, false ]

                    # puts selector
                    # print ">> "

                    if keys.include? selector
                        raw = image.attribute( selector ).value.strip
                        # puts "- #{raw}"
                        #print raw
                        # print "#{raw}: "
                        # puts "Raw: #{raw} \nTest: #{raw.start_with?( '#' )}"
                        item[:type] = raw.start_with?( '#' ) ? :custom : :default
                        # puts "-- #{item[:type]}"
                        #print " > #{item[:type]}"
                        #puts
                        #print '1 OK: '
                        # print "#{item[:type]} >> "

                        # puts "After: #{item[:type]}"
                        # puts

                        item[:text] = raw.split( '#' ).last.strip.gsub( '-', ' ' ).split( ' ' )
                            .map { | a | "#{a[ 0, 1 ].upcase}#{a[ 1, a.length]}" }.join( ' ' )
                        # puts "--- #{item[:text]}"

                        item[:file_name] = item[:text]
                            .split( ' ' )
                            .map { | a | a.downcase }
                            .join( '-' )
                        
                        tests[ 0 ] = true  
                    else
                        #print '1 NOT OK: '
                        # messages.push( 'Attribte "alt" not found.' )
                    end

                    # print "Type: #{item[:type]}  "
                    if keys.include? 'src' and tests[ 0 ]
                        url = raw = image.attribute( 'src' ).value.strip
                        if url =~ URI::regexp
                            name = url
                                .split( '/' )
                                .last
                                .split('.')
                                .first

                            if item[:type] == :default
                                tests[ 1 ] = item[:file_name].eql? name
                            else
                                #puts "---- #{item[:file_name]}"
                                
                                # print "#{}"
                                # print "Check1: #{item[:file_name]}  "
                                # print "Check2: #{name}"

                                tests[ 1 ] = true
                                #puts "---- #{tests.to_s}"
                            end

                            # print "| Name:  #{name} <> File Name: #{item[:file_name]} |"
                            # print "2 OK: #{tests[ 1 ]}"
                        else
                            # print '2 NOT OK: '
                            messages.push( "#{index}: Invalid URL." )
                        end
                    else
                    end


                    if tests[ 0 ] and !tests[ 1 ]
                       # puts 'Filename  and Name are not identical.'
                    end


                    if tests.all?
                        # print ">> ALL!"
                        items.push( item )
                    end
                    # puts
                rescue => e
                    puts e
                    messages.push( "#{index}: Some error ooccured" )
                end
            end 

            if !silent
                if messages.length != 0
                    messages.length == 1 ? puts( 'Error found:' ) : puts( 'Errors found:' ) 
                    messages.each { | m | puts( '- ' + m ) }
                end
            end

            result = {
                total: images.length.to_s,
                items: items,
                messages: messages
            }

            @cmds.push( result )
            @cmds = @cmds.flatten()

            return result
        end


        def inspect_images( readmes )
            l = readmes.map { | a | a[:folder].length }.max + 5
        
            puts '     NAME                                   IMAGES   HEADERS   ERRORS'
            readmes.each.with_index do | readme, index |

                space = ( 3 - index.to_s.length ).times.map { | a | ' ' }.join( '' )
                print "[#{index}]#{space}"

                space = ( l - readme[:folder].length ).times.map { | a | ' ' }.join( '' )
                print "#{readme[:folder]}#{space}"

                space = ( 3 - readme[:headers][:total].to_s.length ).times.map { | a | ' ' }.join( '' )
                print "#{space}#{readme[:headers][:total]}"

                space = ( 10 - readme[:headers][:items].length.to_s.length ).times.map { | a | ' ' }.join( '' )
                print "#{space}#{readme[:headers][:items].length}"

                space = ( 9 - readme[:headers][:messages].length.to_s.length ).times.map { | a | ' ' }.join( '' )
                print "#{space}#{readme[:headers][:messages].length}"

                puts
            end
        end


        def inspect_text( readmes )
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

            l = readmes.map { | a | a[:folder].length }.max + 5
            puts '     NAME'
            readmes.each.with_index do | readme, index |

                space = ( 3 - index.to_s.length ).times.map { | a | ' ' }.join( '' )
                print "[#{index}]#{space}"

                space = ( l - readme[:folder].length ).times.map { | a | ' ' }.join( '' )
                print "#{readme[:folder]}#{space}"

                list = readmes[ index ][:headers][:items]
                    .map { | a | a[:text] }

                list.each do | search |
                    f = tests.find { | a | a[ 0 ].eql? search }
                    print f.nil? ? "#{other} " : "#{f[ 1 ]} "
                end

                # tests.each.with_index do | test, rindex |
                #    r = list.include? test
                #    print "#{r ? "#{rindex}" : ' '}  "
                # end

                puts
            end

            puts 
            tests.each { | a | puts "#{a[1]}  #{a[0]}"}
            puts "#{other}  Other"

        end
    end
end