<a href="#hi-my-name">
  <img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/a6b8/readme/headlines/hi-my-name-is.svg" height="38px" alt="# Hi! My Name is" name="hi-my-name">
</a>

```Ruby
ords = [ 97, 110, 100, 114, 101, 97, 115, 32, 98, 97, 110, 104, 111, 108, 122, 101, 114 ]
chars = ords
  .reject { | n | n==32 }
  .map { | n | n.chr }
a, b = chars.slice!( 1...ords.index( 32 ) ), chars.slice( 2.. )
user_name = "a#{a.length}b#{b.length}"

# > a6b8
```

On this Page you can find a selection of my open-source work. In terms of programming languages and libraries this selection is kind of representativ. I usally work with a bigger variety of tools.

<a href="#language">
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/ruby/ruby.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/javascript/javascript.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/ethereum/ethereum.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/docker/docker.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/nodejs/nodejs.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/react/react.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/python/python.png"></code>
  <code><img height="22" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/git/git.png"></code>
</a>

<br>
<br>

<a href="#hi-my-name">
  <img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/a6b8/readme/headlines/latest-projects.svg" height="38px" alt="Latest Projects" name="latest-projects">
</a>

My mission is to share all my internal used code snippets with the world. Therefore i rewrite the code to modules and add a proper documentation to it.

### 📚 Modules

| Title | ToC | Release | Version | Updated | CI/CD | Statistics |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| 🍒 [Ascii to svg Generator for Ruby](https://github.com/a6b8/ascii-to-svg-generator-for-ruby) | [📖](https://github.com/a6b8/ascii-to-svg-generator-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/ascii_to_svg">RubyGem</a> | <a href="https://rubygems.org/gems/ascii_to_svg"><img src="https://img.shields.io/gem/v/ascii_to_svg?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/ascii-to-svg-generator-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/ascii-to-svg-generator-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/ascii-to-svg-generator-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/ascii-to-svg-generator-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/ascii-to-svg-generator-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/ascii-to-svg-generator-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/ascii_to_svg"><img src="https://img.shields.io/gem/dt/ascii_to_svg?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Console Hash Array for Ruby](https://github.com/a6b8/console-hash-array-for-ruby) | [📖](https://github.com/a6b8/console-hash-array-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/console_hash_array">RubyGem</a> | <a href="https://rubygems.org/gems/console_hash_array"><img src="https://img.shields.io/gem/v/console_hash_array?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/console-hash-array-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/console-hash-array-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/console-hash-array-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/console-hash-array-for-ruby/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/console-hash-array-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/console-hash-array-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -171B21"></a><a href="https://rubygems.org/gems/console_hash_array"><img src="https://img.shields.io/gem/dt/console_hash_array?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Documents with Footer to pdf for Ruby](https://github.com/a6b8/documents-with-footer-to-pdf-for-ruby) | [📖](https://github.com/a6b8/documents-with-footer-to-pdf-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/documents_with_footer_to_pdf">RubyGem</a> | <a href="https://rubygems.org/gems/documents_with_footer_to_pdf"><img src="https://img.shields.io/gem/v/documents_with_footer_to_pdf?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/documents-with-footer-to-pdf-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/documents-with-footer-to-pdf-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/documents-with-footer-to-pdf-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/documents-with-footer-to-pdf-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/documents-with-footer-to-pdf-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/documents-with-footer-to-pdf-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/documents_with_footer_to_pdf"><img src="https://img.shields.io/gem/dt/documents_with_footer_to_pdf?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Feed Into for Ruby](https://github.com/a6b8/feed-into-for-ruby) | [📖](https://github.com/a6b8/feed-into-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/feed_into">RubyGem</a> | <a href="https://rubygems.org/gems/feed_into"><img src="https://img.shields.io/gem/v/feed_into?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/feed-into-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/feed-into-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/feed-into-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/feed-into-for-ruby/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/feed-into-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/feed-into-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -171B21"></a><a href="https://rubygems.org/gems/feed_into"><img src="https://img.shields.io/gem/dt/feed_into?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Local Path Builder for Ruby](https://github.com/a6b8/local-path-builder-for-ruby) | [📖](https://github.com/a6b8/local-path-builder-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/local_path_builder">RubyGem</a> | <a href="https://rubygems.org/gems/local_path_builder"><img src="https://img.shields.io/gem/v/local_path_builder?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/local-path-builder-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/local-path-builder-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/local-path-builder-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/local-path-builder-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/local-path-builder-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/local-path-builder-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/local_path_builder"><img src="https://img.shields.io/gem/dt/local_path_builder?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Markdown Titles to svg for Ruby](https://github.com/a6b8/markdown-titles-to-svg-for-ruby) | [📖](https://github.com/a6b8/markdown-titles-to-svg-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/markdown_titles_to_svg">RubyGem</a> | <a href="https://rubygems.org/gems/markdown_titles_to_svg"><img src="https://img.shields.io/gem/v/markdown_titles_to_svg?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/markdown-titles-to-svg-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/markdown-titles-to-svg-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/markdown-titles-to-svg-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/markdown-titles-to-svg-for-ruby/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/markdown-titles-to-svg-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/markdown-titles-to-svg-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -171B21"></a><a href="https://rubygems.org/gems/markdown_titles_to_svg"><img src="https://img.shields.io/gem/dt/markdown_titles_to_svg?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Masked Ape Club for Ruby](https://github.com/a6b8/masked-ape-club-for-ruby) | [📖](https://github.com/a6b8/masked-ape-club-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/masked_ape_club">RubyGem</a> | <a href="https://rubygems.org/gems/masked_ape_club"><img src="https://img.shields.io/gem/v/masked_ape_club?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/masked-ape-club-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/masked-ape-club-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/masked-ape-club-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/masked-ape-club-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/masked-ape-club-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/masked-ape-club-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/masked_ape_club"><img src="https://img.shields.io/gem/dt/masked_ape_club?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍏 [Statosio for Javascript](https://github.com/a6b8/statosio-for-javascript) | [📖](https://github.com/a6b8/statosio-for-javascript#table-of-contents) | <a href="https://cdnjs.com/libraries/statosio">cdnjs</a> | <a href="https://cdnjs.com/libraries/statosio"><img src="https://img.shields.io/cdnjs/v/statosio?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/statosio-for-javascript"><img src="https://img.shields.io/github/last-commit/a6b8/statosio-for-javascript?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/statosio-for-javascript"><img src="https://img.shields.io/circleci/build/github/a6b8/statosio-for-javascript/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/statosio-for-javascript/stargazers"><img src="https://img.shields.io/github/stars/a6b8/statosio-for-javascript?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a>  |
| 🍒 [Statosio for Ruby](https://github.com/a6b8/statosio-for-ruby) | [📖](https://github.com/a6b8/statosio-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/statosio">RubyGem</a> | <a href="https://rubygems.org/gems/statosio"><img src="https://img.shields.io/gem/v/statosio?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/statosio-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/statosio-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/statosio-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/statosio-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/statosio-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/statosio-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/statosio"><img src="https://img.shields.io/gem/dt/statosio?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🫐 [Statosio for Wordpress](https://github.com/a6b8/statosio-for-wordpress) | [📖](https://github.com/a6b8/statosio-for-wordpress#table-of-contents) |   |   | <a href="https://api.github.com/repos/a6b8/statosio-for-wordpress"><img src="https://img.shields.io/github/last-commit/a6b8/statosio-for-wordpress?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/statosio-for-wordpress"><img src="https://img.shields.io/circleci/build/github/a6b8/statosio-for-wordpress/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/statosio-for-wordpress/stargazers"><img src="https://img.shields.io/github/stars/a6b8/statosio-for-wordpress?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a>  |
| 🍒 [Write Invoice for Ruby](https://github.com/a6b8/write-invoice-for-ruby) | [📖](https://github.com/a6b8/write-invoice-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/write_invoice">RubyGem</a> | <a href="https://rubygems.org/gems/write_invoice"><img src="https://img.shields.io/gem/v/write_invoice?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/write-invoice-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/write-invoice-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/write-invoice-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/write-invoice-for-ruby/main?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/write-invoice-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/write-invoice-for-ruby?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -0E1116"></a><a href="https://rubygems.org/gems/write_invoice"><img src="https://img.shields.io/gem/dt/write_invoice?color=0E1116&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |
| 🍒 [Xml Tree Viewer for Ruby](https://github.com/a6b8/xml-tree-viewer-for-ruby) | [📖](https://github.com/a6b8/xml-tree-viewer-for-ruby#table-of-contents) | <a href="https://rubygems.org/gems/xml_tree_viewer">RubyGem</a> | <a href="https://rubygems.org/gems/xml_tree_viewer"><img src="https://img.shields.io/gem/v/xml_tree_viewer?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://api.github.com/repos/a6b8/xml-tree-viewer-for-ruby"><img src="https://img.shields.io/github/last-commit/a6b8/xml-tree-viewer-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> | <a href="https://circleci.com/api/v1.1/project/github/a6b8/xml-tree-viewer-for-ruby"><img src="https://img.shields.io/circleci/build/github/a6b8/xml-tree-viewer-for-ruby/main?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&token=1&label="></a> | <a href="https://github.com/a6b8/xml-tree-viewer-for-ruby/stargazers"><img src="https://img.shields.io/github/stars/a6b8/xml-tree-viewer-for-ruby?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a><a href="#latest-projects"><img src="https://img.shields.io/badge/- / -171B21"></a><a href="https://rubygems.org/gems/xml_tree_viewer"><img src="https://img.shields.io/gem/dt/xml_tree_viewer?color=171B21&logo=F3A966&logoColor=F3A966&style=flat&label="></a> |

🟥 Ruby 🟩 JavaScript 🟦 php
<br>
<br>

### 📓 Snippets

| Name | Description | Size | Updated |
| :--- | :--- | :--- | :--- |
| 🍒 [allow_list.rb](https://gist.github.com/a6b8/4b7276ff89b4aad7064f81b807a34f4c) | Hash to Allow/Block List Array in Ruby | 5409 | Jun, 2021 |
| 🍒 [bump_version_number.rb](https://gist.github.com/a6b8/ca9b1b9b3f3c898c3e78da42c1fc7603) | Bump Version Number | 420 | Sep, 2021 |
| 🍏 [compare_array_of_strings.js](https://gist.github.com/a6b8/250ee76db881b4e0ad43a992278de42d) | Array of Strings comparison.  | 2340 | Dec, 2021 |
| 🍒 [env_load.rb](https://gist.github.com/a6b8/1805414b8ff076c326f5a05de429e776) | Load  .env file without  a module | 642 | Dec, 2021 |
| 🍏 [find-broken-links.js](https://gist.github.com/a6b8/c9459bf12f05a92d97cca87f79921396) | Find Broken Links | 862 | Jan, 2022 |
| 🍒 [google_fonts_download.rb](https://gist.github.com/a6b8/45116327936c0edae17f8a8138efa07d) | Google Font Download as .ttf | 1862 | Oct, 2021 |
| 🍒 [markdown_options_tables.rb](https://gist.github.com/a6b8/3f05e93bd4c73eb71d1e047d46c28cf3) | Create Option Markdown | 1715 | Jul, 2021 |
| 🍒 [options_validation.rb](https://gist.github.com/a6b8/d2edaadcdd93fbc22fffe977079abe64) | Options Validation | 3612 | Oct, 2021 |
| 🍒 [overview_markdown_table.rb](https://gist.github.com/a6b8/e9496ea255d8db40ade0cd7ac4217cee) | Overview Markdown Table | 6869 | Oct, 2021 |
| 🍒 [shuffle_hash_of_arrays.rb](https://gist.github.com/a6b8/42724db49e52327ad12428744b0b6915) | Shuffle hash of arrays | 2812 | Oct, 2021 |

<br>
<br>

### 📝 Documentations

| Name | Struct | Pages | Tutorials | Options | Examples | Url |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| <a href="https://github.com/a6b8/statosio.js"><img src="https://docs.statosio.com/assets/images/statosio.png" style="max-width: 100%; height: 25px; filter: grayscale(1);"></a> | [🏗️](https://github.com/a6b8/docs.statosio.com/blob/main/__generate/struct/blocks.json) | [58](https://docs.statosio.com/sitemap.xml) | [6](https://docs.statosio.com/tutorials/) | [41](https://docs.statosio.com/options/) | [80](https://docs.statosio.com/options/#categories) | [docs.statosio.com](https://docs.statosio.com) |
| <a href="https://github.com/a6b8/write-invoice-for-ruby"><img src="https://docs.writeinvoice.com/assets/images/logo.png" style="max-width: 100%; height: 25px; filter: grayscale(1);"></a> | [🏗️](https://github.com/a6b8/write-invoice-for-ruby-documentation/blob/main/__generate/struct/blocks.json) | [165](https://docs.writeinvoice.com/sitemap.xml) | [5](https://docs.writeinvoice.com/tutorials/) | [146](https://docs.writeinvoice.com/options/) | [259](https://docs.writeinvoice.com/options/#categories) | [docs.writeinvoice.com](https://docs.writeinvoice.com) |

<br>
<br>


### More Stuff 

- [Dockerhub](https://hub.docker.com/u/a6b8)
- [Github Gist](https://gist.github.com/a6b8)
- [Npm](https://www.npmjs.com/~a6b8)
- [RubyGems](https://rubygems.org/profiles/a6b8)


<br>
<a href="#welcome">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/a6b8/readme/headlines/stats.svg" height="38px" alt="Statistic" name="statistic">
</a>

| **Github Stats** | **Languages** |
| :-- | :-- |
| <a href="#stats">![overview](https://github-readme-stats.vercel.app/api?username=a6b8&show_icons=true&hide_title=true&icon_color=CAD1D8&text_color=CAD1D8&bg_color=0E1116&hide_border=true&title_color=6CCF64) | ![languages](https://github-readme-stats.vercel.app/api/top-langs/?username=a6b8&langs_count=8&show_icons=true&hide_title=true&icon_color=CAD1D8&text_color=CAD1D8&bg_color=0E1116&hide_border=true&title_color=CAD1D8&layout=compact)</a> |

<br>

<a href="#welcome">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/a6b8/readme/headlines/social.svg" height="38px" alt="Social" name="social">
</a>

| Logo | Name |
| :--- | :--- |
| <a href="https://twitter.com/a6b8"><img align="left" alt="Andreas´s Twitter" width="22px" src="https://raw.githubusercontent.com/peterthehan/peterthehan/master/assets/twitter.svg" /></a> | Twitter | 
| <a href="https://www.linkedin.com/in/andreas-banholzer/"><img align="left" alt="Andreas´s LinkedIN" width="22px" src="https://raw.githubusercontent.com/peterthehan/peterthehan/master/assets/linkedin.svg" /> </a> | LinkedIn |


<br>
<br>

<a href="#welcome">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/docs/a6b8/readme/headlines/support-my-work.svg" height="38px" alt="Support my Work">
</a>

<a href="https://www.buymeacoffee.com/a6b8" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" height="40"></a>

