## Release Sommer 2021
My mission is to share all my internal used code snippets with the world. Rewrite the code to module and add a proper documentation.

- [x] [Statosio for ruby (June 2021)](https://github.com/a6b8/statosio.rb)
- [x] [Statosio for wordpress (June 2021)](https://github.com/a6b8/statosio.wp)
- [x] [Statosio Helpers (June 2021)](https://github.com/a6b8/statosio-tooolbox)
- [ ] AsciiToSvg Generator for ruby
- [ ] Invoice Generator for Ruby
- [ ] Local Path creator for Ruby
- [ ] XML Tree Renderer
- [ ] Statosio for Elementor
- [ ] Options Validatior for Javascript
- [ ] Blockchain ETL Documentation


<img src="assets/welcome-1.png" height="70" />

```Ruby
ords = [ 97, 110, 100, 114, 101, 97, 115, 32, 98, 97, 110, 104, 111, 108, 122, 101, 114 ]
chars = ords
  .reject { | n | n==32 }
  .map { | n | n.chr }
a, b = chars.slice!( 1...ords.index( 32 ) ), chars.slice( 2.. )
user_name = 'a' + a.length.to_s + 'b' + b.length.to_s

# > a6b8
```

On this Page you can find a selection of my Open-Source Work. In Terms of Programming Languages and Libraries this selection is kind of representativ. I usally work with a bigger variety of tools.
<br>
<br>
<br>
<img src="assets/overview-1.png" height="60" />

| **Github Stats** | **Languages** |
| :-- | :-- |
| ![overview](https://github-readme-stats.vercel.app/api?username=a6b8&show_icons=true&hide_title=true&icon_color=CAD1D8&text_color=CAD1D8&bg_color=0E1116&hide_border=true&title_color=6CCF64) | ![languages](https://github-readme-stats.vercel.app/api/top-langs/?username=a6b8&langs_count=8&show_icons=true&hide_title=true&icon_color=CAD1D8&text_color=CAD1D8&bg_color=0E1116&hide_border=true&title_color=CAD1D8&layout=compact) |

<br>
<br>
<img src="assets/open-source-projects-1.png" height="60" />

> Here is a list of some of my open source projects. Feel free to reach out, send pull request or give feedback.

| **Year** | **Project** | **Description** | **Status** | **Tags** | **Links** |
| :-- | :-- | :-- | :-- | :-- | :-- |
| 2021 | Rss Discover Service | Ruby API to find RSS Feeds from input sources. | Release Phase 1 | ```Api```, ```Heroku```, ```JSON```, ```Nokogiri```, ```Ruby```, ```Sinatra```, ```XML``` |  <ul><li>[Github: Repository](https://github.com/a6b8/rss-discover-service)</ul></li> |
| 2020 | Statosio.js Documentation | Documentation for statosio.js. With many use case examples and examples for each parameter. | Release Phase 1 | ```Documentation```, ```Jekyll```, ```Markdown```, ```Ruby``` | <ul><li>[Github: Repository](https://github.com/a6b8/d3.statosio.com)</li><li>[Documentation: d3.statosio.com](https://d3.statosio.com)</li><li>[Cdnjs: Detailsite](https://cdnjs.com/libraries/statosio)</ul></li> |
| 2020 | Statosio.js | statosio.js is an add-on function for d3 to generate simple charts, in a fast and reliable way. | Release Phase 1 | ```D3```, ```HTML```, ```Javascript```,   | <ul><li>[Github: Repository](https://github.com/a6b8/statosio.js)</li><li>[Youtube: Introduction](https://www.youtube.com/watch?v=i6od9O8jz1E)</li><li>[Hackernews: Points](https://news.ycombinator.com/item?id=25344450)</ul></li> |
| 2019 | RSS Merge Service | This service helps to consume thousands of rss feeds in an easy way. By merging feeds into topic feeds which can be implemented with a singel .opml file. | Final | ```Docker-Compose```, ```OPML```, ```Rancher```, ```RSS```, ```Ruby```, ```S3```, ```Slack```, ```Spreadsheet``` | <ul><li>[Github: Repository](https://github.com/a6b8/rss-merge-service)</ul></li> |
| 2019 | Chrome Web Content Swap | This chrome extension swaps out useless thumbnail and recommendations and change it to your selection queue. | Deprecated | ```Javascript```, ```HTML/Css```, ```Browser Extension``` | <ul><li>[Github: Repository](https://github.com/a6b8/chrome-web-content-swap)</ul></li> |
| 2018 | Placeholder Webpage for Docker | Highly flexible Placeholder / Fallback Node.js Webservver as a Docker Image, optimized for Rancher and Docker-Compose. | Final | ```Docker-Compose```, ```Javascript```, ```Node.js```, ```p5.js```, ```Rancher``` | <ul><li>[Github: Repository](https://github.com/a6b8/placeholder-webpage-docker)</ul></li> | 
| 2018 | YAML Generator | Visual YAML Generator for creating a Boilerplate Loadbalancing & Port Routing Infrastructure | Deprecated | ```Docker-Compose```, ```Javascript```, ```p5.js```, ```Rancher```, ```YAML``` | <ul><li>[Github: Repository](https://github.com/a6b8/yaml-generator-loadbalancer)</ul></li> | 

## Support my Work
Donate by [Paypal](https://www.paypal.com/donate?hosted_button_id=XKYLQ9FBGC4RG)

