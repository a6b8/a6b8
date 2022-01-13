module Totals
    def self.generate( struct )
        file = File.read( struct )
        hash = JSON.parse( file ).with_indifferent_access

        all = repos_all( github_user: hash[:meta][:github_user] )
        sorted = repos_fork( repos: all )

        return to_markdown( github_user: hash[:meta][:github_user], data: sorted )
    end


    def self.repos_all( github_user: )
        all = []
        expand = true
        nr = 1
        while( expand )
            url = "https://api.github.com/users/#{github_user}/repos?page=#{nr}"
            uri = URI( url )
            response = Net::HTTP.get( uri )
            txt = JSON.parse( response )
            txt = {
                :data => txt
          }
          if txt[:data].length == 0
            expand = false
          else
            txt = txt.with_indifferent_access
            all.concat( txt[:data] )
            all = all.flatten
            nr = nr + 1
          end
        end
        
        return all
    end


    def self.repos_fork( repos: )
        types = [ 
            [ :created, false ],
            [ :forked, true ]
        ]
      
        
        result = types.inject( {} ) do | items, n |
            items[ n[ 0 ] ] = repos
                .select { | a | a[:fork] == n[ 1 ] and a[:archived] == false }
                .map { | a | a[:name] }   
            items
        end
        
        result[:archived] = repos
            .select { | a | a[:archived] == true }
            .map { | a | a[:name] }   
        
        return result
    end


    def self.to_markdown( github_user:, data: )
        config = {
            root: 'https://github.com/{{gh_user}}',
            routes: {
                created: 'tab=repositories&q=&type=source',
                forked: 'tab=repositories&q=&type=forked',
                archived: 'tab=repositories&q=&type=archived'
            }
        }
    
        config[:root] = config[:root].gsub( '{{gh_user}}', github_user )
          
        config[:routes].keys.each do | key |
            config[:routes][ key ] = "#{config[:root]}?#{config[:routes][key]}"
        end

        strs = []
        data.each do | k, v | 
            str = "- #{k}: [#{v.length}](#{config[:routes][k]})"
            strs.push( str )
        end

        return strs.join( "\n" )
    end
end