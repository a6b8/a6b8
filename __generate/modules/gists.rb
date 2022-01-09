module Gists
    def self.generate( struct )
        file = File.read( struct )
        config = JSON.parse( file ).with_indifferent_access
        gh_user = config['meta']['github_user']

        url = "https://api.github.com/users/#{gh_user}/gists"
        uri = URI( url )
        response = Net::HTTP.get( uri )
        gists = JSON.parse( response )

=begin
        languages = gists.map { | gist |
            key = gist['files'].keys[ 0 ]
            gist['files'][ key ]['language']
        }.to_set.to_a.sort


        grouped = languages.inject( {} ) do | item, language |
            found = gists.select { | gist | 
                key = gist['files'].keys[ 0 ]
                gist['files'][ key ]['language'].eql? language      
            }

            item[ language.to_sym ] = found
            item
        end
=end
        grouped = {}
        grouped[:Gists] = gists.select do | gist |
            key = gist['files'].keys[ 0 ]
            language = gist['files'][ key ]['language']
            ['Ruby', 'JavaScript' ].include? language 
        end

        tables = []
        grouped.keys.each do | key |
            struct = self.prepare_table( key, grouped[ key ], gh_user, config )
            table = self.create_table( struct )
            tables.push( { key: key, table: table } )
        end

        strs = ''
        tables.each do | table |
           # strs << "### #{table[:key]}\n"
           # strs << "\n"
            strs << table[:table]
            #strs << "\n"
        end

        return strs
    end


    def self.prepare_table( key, items, gh_user, config )
        struct = {
            language: key,
            rows: []
        }

        items.each do | item |
            row = {
                name: nil,
                description: nil,
                updated: nil,
                size: nil,
                url: nil,
                language: nil,
                emoji: nil
            }

            key = item['files'].keys[ 0 ]

            row[:name] = item['files'][ key ]['filename']
            row[:description] = item['description']
            row[:updated] = Time.parse(item['updated_at']).strftime( '%b, %Y')
            row[:size] = item['files'][ key ]['size']
            row[:url] = "https://gist.github.com/#{gh_user}/#{item['id']}"
            row[:language] = item['files'][ key ]['language']
            row[:emoji] = config['types'][ row[:language].downcase ]
            struct[:rows].push( row )
        end

        struct[:rows] = struct[:rows]
            .sort_by { | a | a[:name] }

        return struct
    end


    def self.create_table( struct )
        strs = ''
        columns = [ 'Name', 'Description', 'Size', 'Updated' ]
        strs << columns.map { | a |  " #{a} |" }.join( '' ).insert( 0, '|' ).concat( "\n" )
        strs << columns.map { | a |  " :--- |" }.join( '' ).insert( 0, '|' ).concat( "\n" )

        struct[:rows].each do | row |
            c = []
            columns.each do | column |
                case column
                when 'Name'
                    str = " #{row[:emoji]} [#{row[:name]}](#{row[:url]}) |" 
                    c.push( str )
                when 'Description'
                    str = " #{row[:description]} |"
                    c.push( str )
                when 'Updated'
                    str = " #{row[:updated]} |"
                    c.push( str )
                when 'Size'
                    str = " #{row[:size]} |"
                    c.push( str )
                end
            end

            strs << c.join( '' ).insert( 0, '|' ).concat( "\n" )
        end

        struct[:rows].each do | row |

        end


        return strs
    end
end