module Repositories
    def self.generate( struct )
        file = File.read( struct )
        hash = JSON.parse( file ).with_indifferent_access
        hash[:projects] = hash[:projects].sort_by { | a | a[:name] }

        return markdown( hash )
    end


    private


    def self.helper( obj, index )
        puts obj[:projects][ index ]
        current = obj[:projects][ index ]
    
        puts '> INPUT'
        current.each do | k, v | 
            space = ( 15 - k.length ).times.map { | a | ' ' }.join( '' )
            puts( "  #{k}:#{space}#{v}" ) 
        end
        puts
    
        item = markdown_url( current, index, obj )
        puts '> TO URL'
        item.each do | k, v | 
            space = ( 15 - k.length ).times.map { | a | ' ' }.join( '' )
            puts( "  #{k}:#{space}#{v}" ) 
        end
    
        puts
        puts '> TO HTML'
        html = markdown_html( current, item, obj )
        html.each do | k, v | 
            space = ( 15 - k.length ).times.map { | a | ' ' }.join( '' )
            puts( "  #{k}:#{space}#{v.to_s}" ) 
        end 
        
        return true
    end
  
  
    def self.markdown_url( item, index, obj )
        def self.theme( index, obj, add={} )
            a = obj[:theme]
                .map { | k, v | [ k, k.eql?( 'color' ) ?  v[ index % 2 ] : v ] }
                .inject( {} ) { | item, k |  item[ k[ 0 ] ] = k[ 1 ]; item } 
            b = URI.encode_www_form( a.merge( add ) )
            
            result = "?#{b}"
    
            return result
        end
        
        
        def self.title( item, obj )
            obj[:endpoints][:github_repo]
                .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                .gsub( '{{gh_repo}}', item[:github] )
        end
        
        
        def self.doc( item, obj )
            if item[:docs]
                obj[:endpoints][:github_repo]
                    .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                    .gsub( '{{gh_repo}}', item[:github] )
                    .concat( '#table-of-contents' )
            end
        end
        
        
        def self.release( item, index, obj )
            result = nil
            case item[:type]
                when :ruby
                    if item.keys.include? 'gem'
                        result = obj[:endpoints][:shield_io]
                            .gsub( '{{label}}', 'RubyGem' )
                            .gsub( '{{color}}', obj[:theme][:color][ index%2 ])
                    end
                when :javascript
                    result = obj[:endpoints][:shield_io]
                        .gsub( '{{label}}', 'cdnjs' )
                        .gsub( '{{color}}', obj[:theme][:color][ index%2 ] )
                when :php
                else
                    puts "#{item[:type]} not set."
            end
            return result
        end
        
        
        def self.version( item, index, obj )
            result = nil
            case item[:type]
                when :ruby  
                    if item.keys.include? 'gem'
                        result = obj[:endpoints][:gem_version]
                        .gsub( '{{gem_name}}', item[:gem] )
                    end
                when :javascript
                    if item.keys.include? 'js'
                        result = obj[:endpoints][:cdnjs]
                        .gsub( '{{js_name}}', item[:js] )
                    end
                when :php
            else
                puts "#{item[:type]} not set."
            end
            
            !result.nil? ? result.concat( theme( index, obj, { label: '' } ) ) : ''
            
            return result
        end
    
    
        def self.statistics( item, index, obj )
            result = nil
            case item[:type]
                when :ruby
                    if item.keys.include? 'gem'
                        result = obj[:endpoints][:gem_downloads]
                            .gsub( '{{gem_name}}', item[:gem] )
                    end
                when :javascript
                when :php
            else
                puts "#{item[:type]} not set."
            end
            
            !result.nil? ? result.concat( theme( index, obj, { label: '' } ) ) : ''
            
            return result
        end
  
  
        def self.space( item, index, obj )
            result = obj[:endpoints][:shield_io]
                .gsub( '{{label}}', ' / ' )
                .gsub( '{{color}}', obj[:theme][:color][ index % 2 ] )
        end
  
  
        def self.stars( item, index, obj )
            result = obj[:endpoints][:github_repo_stars]
                .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                .gsub( '{{gh_repo}}', item[:github] )
                .concat( theme( index, obj, { label: '' } ) )
            return result
        end
    
    
        def self.updated( item, index, obj )
            result = obj[:endpoints][:github_last_commit]
                .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                .gsub( '{{gh_repo}}', item[:github] )
        
            !result.nil? ? result.concat( theme( index, obj, { label: '' } ) ) : ''
        end
    
    
        def self.test( item, index, obj )
            result = nil
    
            if item.keys.include? 'circle_ci'
                result = obj[:endpoints][:circle_ci]
                    .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                    .gsub( '{{gh_repo}}', item[:github] )
                result.concat( theme( index, obj, { token: item[:circle_ci], label: '' } ) )
            end
    
            return result
        end


        def self.license( item, index, obj )
            result = obj[:endpoints][:github_license]
                .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                .gsub( '{{gh_repo}}', item[:github] )
            result.concat( theme( index, obj, { token: item[:circle_ci], label: '' } ) )

            return result
        end
      
    
        struct = {
            title: nil,
            doc: nil,
            # release: nil,
            version: nil,
            updated: nil,
            test: nil,
            statistics: nil,
            license: nil
        }
  
        item[:type] = item[:type].to_sym
    
        struct[:title] = title( item, obj )
        struct[:doc] = doc( item, obj )
        # struct[:release] = release( item, index, obj )
        struct[:version] = version( item, index, obj )
        struct[:stars] = stars( item, index, obj )
        struct[:space] = space( item, index, obj )
        struct[:statistics] = statistics( item, index, obj )
        struct[:updated] = updated( item, index, obj )
        struct[:test] = test( item, index, obj )
        struct[:license] = license( item, index, obj )
        
        return struct
    end
  
  
    def self.markdown_html( current, item, obj )
        def self.image_md( name, url )
            "[#{name}](#{url})"
        end
    
    
        def self.image( str )
            str
                .insert( 0, '<img src="')
                .concat( '">')
        end
    
    
        def self.a( str, href="#latest-projects" )
        str
            .insert( 0, "<a href=\"#{href}\">" )
            .concat( '</a>')    
        end
    
    
        [ 
            :title, 
            :doc, 
            #:release, 
            :version, 
            :statistics, 
            :updated, 
            :test,
            :license
        ].each do | key |
            str = nil
            
            if !item[ key ].nil?
                case key
                    when :title
                        str = image_md( current[:name], item[ key ] )
                            .insert( 0, obj[:types][ current[:type] ] + ' ' )
                    when :doc
                        str = image_md( obj[:types][:docs], item[ key ] )
                    when :release
                        if !item[ key ].nil?
                            str = ''#image( item[ key ] )
                            case current[:type]
                                when :ruby
                                str = 'RubyGem'
                                s = obj[:endpoints][:ruby_gem]
                                    .gsub( '{{gem_name}}', current[:gem] )
                                str = a( str, s )
                                when :javascript
                                str = 'cdnjs'
                                s = obj[:endpoints][:cdnjs_profile]
                                    .gsub( '{{js_name}}', current[:js] )
                                str = a( str, s )
                            else
                                str = a( str )
                            end
                        end
                    when :version
                        str = image( item[ key ] )
                        case current[:type]
                            when :ruby
                                s = obj[:endpoints][:ruby_gem]
                                    .gsub( '{{gem_name}}', current[:gem] )
                                str = a( str, s )
                            when :javascript
                                s = obj[:endpoints][:cdnjs_profile]
                                    .gsub( '{{js_name}}', current[:js] )
                                str = a( str, s )
                            else
                            str = a( str )
                        end          
                    when :statistics
                        str = image( item[ key ] )
                        case current[:type]
                            when :ruby
                                s = obj[:endpoints][:ruby_gem]
                                    .gsub( '{{gem_name}}', current[:gem] )
                                str = a( str, s )
                            when :javascript
                                s = obj[:endpoints][:cdnjs_profile]
                                    .gsub( '{{js_name}}', current[:js] )
                                str = a( str, s )
                            else
                            str = a( str )
                        end
                    when :updated
                        str = image( item[ key ] )
                        url = obj[:endpoints][:github_api_repo]
                            .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                            .gsub( '{{gh_repo}}', current[:github] )
                        str = a( str, url )
                    when :test
                        if !item[ key ].nil?
                            str = image( item[ key ] )
                            url = obj[:endpoints][:circle_ci_status]
                                .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                                .gsub( '{{gh_repo}}', current[:github] )
                                .gsub( '{{cc_token}}', current[:circle_ci] )
                            str = a( str, url )
                        end
                    when :license
                        str = image( item[ key ] )
                        url = obj[:endpoints][:github_license_link]
                            .gsub( '{{gh_user}}', obj[:meta][:github_user] )
                            .gsub( '{{gh_repo}}', current[:github] )
                        str = a( str, url )
                    else
                end
            end
        !str.nil? ? item[ key ] = str : item[ key ] = ' ' 
        end
    
        u = obj[:endpoints][:github_repo]
            .gsub( '{{gh_user}}', obj[:meta][:github_user] )
            .gsub( '{{gh_repo}}', current[:github] )
            .concat( '/stargazers' )
    
        str = image( item[:stars] )
        str = a( str, u )
    
        space = image( item[:space] )
        space = a( space, '#latest-projects' )
    
        !item[ :statistics ].eql?( ' ' ) ? str = str + space : ''
        item[ :statistics ].insert( 0, str )
        
        item.except!( :stars ) 
        item.except!( :space ) 
        return item
    end
  
  
    def self.markdown( obj )
        as = obj[:projects]
            .map.with_index { | project, index |
                item = markdown_url( project, index, obj )
                html = markdown_html( project, item, obj )
        }
    
        strs = []
            .push( as[ 0 ].map { | k, v | 
                k.capitalize.to_s }
                    .map { | a | a.eql?( 'Doc' ) ? 'ToC' : a }
                    .map { | a | a.eql?( 'Test' ) ? 'CI/CD' : a }
                    .join( ' | ' ) 
            )
            .push( as[ 0 ].keys.length.times.map { | a | ':--' }.join(' | ') )
            .push( as.map { | a | a.map { | k, v | v }.join( ' | ' ) } )
            .flatten
            .map { | row | row.insert( 0, '| ').concat(' |' ) }
            .join( "\n" )
        
        return strs
    end

end