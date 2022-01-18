module Experiments
    def self.generate( struct )
        file = File.read( struct )
        hash = JSON.parse( file ).with_indifferent_access
        prepares = prepares( data: hash )
        markdown = to_markdown( prepares: prepares )

        return markdown
    end


    def self.prepares( data: )
        items = []

        data[:projects].each do | project |
            item = {
                name: nil,
                description: nil,
                tags: nil,
                url: '',
            }

            folder = !project[:folder].eql?( nil ) ? ( '/' + project[:folder] ) : ''
            item[:name] = "#{project[:name]}"
            
            item[:desciption] = project[:description]

            item[:year] = project[:year]
            item[:url] << "[#{data[:types][:url]}]"
            item[:url] << "(#{project[:url]})"
            

            item[:tags] = project[:tags]
                .map { | a | 
                    query = URI.encode_www_form( { :q => a } )
                    "#{a}" 
                }
                .join( ', ' )

            items.push( item )
        end

        return items
    end


    def self.to_markdown( prepares: )
        strs = []
        str = prepares[ 0 ]
            .keys
            .map { | a | "#{a.to_s[0, 1].upcase}#{a.to_s[ 1, a.length ]}" }
            .join( ' |' )
            .concat( ' |' )
            .insert( 0, '| ')
        strs.push( str )
         
        str = prepares[ 0 ].keys.length.times.to_a
            .map { | a | ":---" }
            .join( ' |' )
            .concat( ' |' )
            .insert( 0, '| ')
        strs.push( str )

        prepares.each do | prepare |
            str = prepare
                .map { | k, v | v }
                .join( ' | ' )
                .concat( ' |' )
                .insert( 0, '| ')
            strs.push( str )
        end

        return strs.join( "\n" )
    end
end