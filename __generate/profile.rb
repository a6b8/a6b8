def str_space( l, str )
    ( l - str.length ).times.to_a.map { | a | ' ' }.join( '' )
end

require 'uri'
require 'json'
require 'time'

require "active_support/isolated_execution_state"
require 'active_support/core_ext/hash'

require 'net/http'
require 'nokogiri'
require 'fileutils'
require 'active_support/core_ext/hash/indifferent_access'

require './__generate/modules/totals'
require './__generate/modules/repositories'
require './__generate/modules/gists'
require './__generate/modules/documentations'
require './__generate/modules/demonstrations'
require './__generate/modules/experiments'

require './__generate/modules/headlines/markdown'
require './__generate/modules/headlines/font_to_path'

path_repos = './__generate/struct/repositories.json'
path_docus = './__generate/struct/documentations.json'
path_demos = './__generate/struct/demonstrations.json'
path_experiments = './__generate/struct/experiments.json'

path_headers = './__generate/struct/headlines.json'
path_readme = './__generate/templates/README_TEMPLATE.md'
path_export = "#{Dir.pwd.split('__generate').first}/README.md"

overview = {
    totals: true,
    repos: true,
    gists: true,
    docs: true,
    demos: true,
    experiments: true
}

tabs = 40

mode = overview.map { | k, v | v }.any?
readme = File.read( path_readme )
overview.each do | key, value |
    if value
        case key
        when :totals
            insert = Totals.generate( path_repos )
            str = '  - Totals'
            space = str_space( tabs, str )
        when :repos
            insert = Repositories.generate( path_repos )
            str = '  - Repos'
            space = str_space( tabs, str )
        when :gists
            insert = Gists.generate( path_repos )
            str = '  - Gists'
            space = str_space( tabs, str )
        when :docs
            insert = Documentations.generate( path_docus )
            str = '  - Docs'
            space = str_space( tabs, str )
        when :demos
            insert = Demonstrations.generate( path_demos )
            str = '  - Demos'
            space = str_space( tabs, str )
        when :experiments
            insert = Experiments.generate( path_experiments )
            str = '  - Experiments'
            space = str_space( tabs, str )
        end

        puts "#{str}#{space}🟩"
        mode ? readme = readme.gsub( "<<--#{key.to_s.upcase}-->>", insert ) : ''
    end
end

mode ? File.open( path_export, 'w' ) { | f | f.write( readme ) } : ''