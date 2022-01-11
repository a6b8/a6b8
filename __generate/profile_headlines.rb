require 'active_support/core_ext/hash/indifferent_access'

require './__generate/modules/headlines/font_to_path'
require './__generate/modules/headlines/headline'

require 'nokogiri'

path_template = './__generate/templates/README_TEMPLATE.md'
path_repos = './__generate/struct/repositories.json'
path_assets = './assets/headlines'

file = File.read( path_template )
doc = Nokogiri::XML( file )

texts = doc
    .xpath( '//img' )
    .select { | a | a.attribute( 'src' ).text.start_with?( 'https://raw.githubusercontent.com' ) }
    .map { | a | a.attribute( 'name' ).to_s }

type = 'custom'
codes = Headline.generate( path_repos, type, texts )
   
codes.each do | code |
    path = "#{path_assets}/#{type}/#{code[:name]}"
    File.open( path, 'w' ) { | f | f.write( code[:code] ) }
end
#puts codes