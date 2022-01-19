module Documentations
    def self.generate( struct )
        file = File.read( struct )
        hash = JSON.parse( file ).with_indifferent_access
        projects = self.projects( hash )

        mds = self.table( projects, hash )

        return mds
    end


    private 


    def self.table( projects, config )
        mds = ''

        keys = [ 'name', 'struct', 'pages', 'tutorials', 'options', 'examples', 'url', 'up' ]
        mds += "|#{keys.map { | a | " #{a[ 0 ].upcase}#{a[ 1, a.length ]} |" }.join( '' )}\n"
        mds += "|#{keys.map { | a | ' :--- |' }.join( '' )}\n"

        projects.each do | project |
            md = ''
            keys.each do | key |
                case key
                when 'name'
                    style = 'max-width: 100%; height: 25px; filter: grayscale(1);'
                    str =  "<a href=\"#{project[ 'lib' ]}\">"
                    str +=   "<img src=\"#{project[ 'logo' ]}\" style=\"#{style}\">"
                    str += "</a>" 
                when 'struct'
                    str = "[🏗️](#{project[ 'struct' ]})"
                when 'tutorials'
                    str = "[#{project[ key ]}](#{project[ 'url' ]}/tutorials/)"
                when 'pages'
                    str = "[#{project[ key]}](#{project[ 'url' ]}/sitemap.xml)"
                when 'examples'
                    str = "[#{project[ key ]}](#{project[ 'url' ]}/options/#categories)"
                when 'options'
                    str = "[#{project[ key ]}](#{project[ 'url' ]}/options/)"
                when 'url'
                    str = "[#{project[ 'url' ].gsub( 'https://', '' )}](#{project[ 'url' ]})"
                when 'up'
                    href = config[:endpoints][:uptime_robot]
                        .gsub( '{{uptime_key}}', project[:uptime] )

                    str = ''
                    str = str
                        .concat( '<a href="#-modules"><img src="')
                        .concat( "#{href}" )
                        .concat( "?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label=" )
                        .concat( '"></a>')
                else

                end
                md += " #{str} |"
            end 
            mds += "|#{md}\n"
        end

        return mds
    end


    def self.project( project )
        def self.sitemap( project )
            url = "#{project[:url]}/sitemap.xml"
            uri = URI( url )
            response = Net::HTTP.get( uri )
            doc = Nokogiri::XML( response )
            urls = doc.css( 'url' )
                .map { | a | a.at( 'loc' ).text }
                .map { | a | a.gsub( 'http://', 'https://' ) }
                .map { | a | a.split( project[:url] + '/' ).last }
                .reject{ | a | a == nil }
                .sort
    
            project[:pages] = urls.length
    
            [ :options, :tutorials ].each do | key |
                project[ key ] = urls
                    .select { | a | a.start_with?( "#{key}/" ) }
                    .length - 1
            end
            return project
        end


        def self.options( project )
            url = "#{project[:url]}/options/"
            uri = URI( url )
            response = Net::HTTP.get( uri )
            doc = Nokogiri::XML( response )
    
            project[ :examples ] = doc.css( 'table')
                .map { | a | a.css( 'a' ).map { | b | b.attribute( 'href' ).text } }
                .flatten()
                .reject { | a | a.index( '#example').nil? }
                .to_set
                .to_a
                .length
    
            return project
        end


        project = self.sitemap( project )
        project = self.options( project )

        return project
    end


    def self.projects( obj )
        sitemaps = []
        obj[:projects].each do | project |
            pp = self.project( project )
            sitemaps.push( pp )
        end

        return sitemaps
    end
end