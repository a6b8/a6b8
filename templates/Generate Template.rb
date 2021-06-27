require 'net/http'
require "active_support/core_ext/hash/indifferent_access"

hash = {
  params: {
    repo_dest: {
      gsub: "[REPOSITORY_DEST]",
      text: "xml-tree-viewer-for-ruby"
    },
    repo_origin: {
      gsub: "[REPOSITORY_ORIGIN]",
      text: "a6b8"
    },
    gh_raw: {
      gsub: "[GITHUB_RAW]",
      text: "https://raw.githubusercontent.com"
    },
    gh_user: {
      gsub: "[GITHUB_USERNAME]",
      text: "a6b8"
    }
  },
  document: {
    start: {
      str: "<-- START HERE -->",
      length: nil
    },
    template: {
      url: 'https://raw.githubusercontent.com/a6b8/a6b8/main/templates/readme.md'
    },
    output: {
      path: nil
    }
  }
}



hash[:document][:start][:length] = hash[:document][:start][:str].length
hash[:document][:output][:path] = "./#{hash[:params][:repo_dest][:text]}.md"



def create_template( obj )
  uri = URI( obj[:document][:template][:url] )
  text = Net::HTTP.get( uri )
  text=  text[ text.index( obj[:document][:start][:str]) + obj[:document][:start][:length], text.length].strip

  obj[:params].keys.each do | key |
    text.gsub!( obj[:params][ key ][:gsub], obj[:params][ key ][:text])
  end

  return text
end


text = create_template( hash )
File.open( hash[:document][:output][:path], "w" ) { | f | f.write( text ) }



