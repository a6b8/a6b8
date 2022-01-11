module Headline
    def self.generate( struct, key, texts )

        config = JSON
            .parse( open( struct ).read )
            .with_indifferent_access

        font = FontToPath::Font.new( font_name: 
            config[:style][ key ][:font], 
            silent: true 
        )


        results = []
        texts.each.with_index do | text, index |
            c = Marshal
                .load( Marshal.dump( config[:style][ key ] ) )
                .with_indifferent_access
            c['format']['font_path'] = font.config[:font_path]
            svg = FontToPath::SVG.new( config: c )
            svg.convert( text: text )

            item = {
                name: nil,
                code: nil
            }

            item[:name] = text
                .downcase
                .split( ' ' )
                .map { | a | a.gsub( '.', '' ) }
                .join( '-' )
                .concat( '.svg')
            item[:code] = svg.code

            results.push( item )
        end

        font.clean_up
        return results
    end
end