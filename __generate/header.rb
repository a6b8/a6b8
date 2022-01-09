def str_space( l, str )
    ( l - str.length ).times.to_a.map { | a | ' ' }.join( '' )
end

require 'json'
require 'active_support/core_ext/hash/indifferent_access'

require './__generate/modules/headlines/headlines'
require './__generate/modules/headlines/markdown'
require './__generate/modules/headlines/font_to_path'

path_repos = './__generate/struct/repositories.json'

repos = {
    headlines: true
}

tabs = 40

repos.each do | key, value |
    if value
        case key
        when :headlines
            tests = Headlines.generate( struct: path_repos )
            all = tests.map { | a | a[ a.keys[ 0] ] }.all?
            str = '  - Headlines'
            space = str_space( tabs, str )

            puts "#{str}#{space}#{all ? "🟩" : "🟥" }"

            tests.each { | a | 
                k = a.keys[ 0 ].to_s.split( '_' ).map { | a | ( a[ 0, 1 ].upcase + a[ 1, a.length ] ) }.join(' ')
                v = a[ a.keys[ 0 ] ]

                str = "    - #{k}"
                space = str_space( tabs + 4, str )

                puts( "#{str}#{space}#{v ? "🟩" : "🟥" }" ) 
            }
        end
    end
end