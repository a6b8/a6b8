require 'markdown_titles_to_svg'

markdowns = [
    'https://raw.githubusercontent.com/a6b8/statosio-for-ruby/main/README.md',
    'https://raw.githubusercontent.com/a6b8/a6b8/main/README.md',
    'https://raw.githubusercontent.com/a6b8/ascii-to-svg-generator-for-ruby/main/README.md'
]

MarkdownTitlesToSvg.generate( 
    markdowns,
    'a6b8',
    {
        font__google_fonts__h1__name: 'Courgette',
        #style__color__default: '#EA8872'
        style__h1__color__default: '#EA8872',
        style__default__stroke__weight: 10px,
        style__default__color__default: '#EA8872'
        #font__source__google_fonts__name: 'Alfa Slab One'
    }
)