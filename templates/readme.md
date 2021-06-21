CHANGE VARIALBES

| NR | REPLACE | Example |
| :--- | :--- | :--- |
| 1 | [REPOSITORY_DEST] | "documents-with-footer-to-pdf"|
| 2 | [REPOSITORY_ORIGIN] | "a6b8" |
| 3 |  test | test |
| 4 | [GITHUB_RAW] | "https://raw.githubusercontent.com/" |
| 5 | [GITHUB_USERNAME] | "a6b8" |

<-- START HERE -->


<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/Headline.svg" height="55px" name="headline" alt="# Headline">
</a>

Short Description Text 
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/examples.svg" height="55px" name="examples" alt="Examples">
</a>
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/table-of-contents.svg" height="55px" name="table-of-contents" alt="Table of Contents">
</a>
<br>
1. [Quickstart](#quickstart)<br>
2. [Parameters](#parameters)<br>
3. [Options](#options)<br>
4. [Contributing](#contributing)<br>
5. [Limitations](#limitations)<br>
6. [Credits](#credits)<br>
7. [License](#license)<br>
8. [Code of Conduct](#code-of-conduct)<br>
9. [Support my Work](#support-my-work)<br>

<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/quickstart.svg" height="55px" name="quickstart" alt="Quickstart">
</a>

```ruby

```
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/local-path-builder-for-ruby/readme/headlines/setup.svg" height="55px" name="setup" alt="Setup">
</a>

Add this line to your application's Gemfile:

```ruby
gem 'test'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install test


On Rubygems: 
- Gem: https://rubygems.org/gems/test
- Profile: https://rubygems.org/profiles/a6b8

<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/methods.svg" height="55px" name="methods" alt="Methods">
</a>

### .example()
```ruby
    require 'local_path_builder'

    hash = Template.example( 
        headline, 
        console_mode,  
        options 
    )
```


**Input**
| **Type** | **Required** | **Description** | **Example** | **Description** |
|------:|:------|:------|:------|:------| 
| **headline** | ```String``` | Yes | "Test" | Define path structure |
| **console mode** | ```Symbol``` | Yes | ```:hash``` | Set test console output mode. Use ```:silent```, ```:hash```, ```:path``` or ```:both``` |
| **salt** | ```String``` | No | ```123``` | Use test salt to create unique filenames. |

**Return**<br>
Hash    
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/options.svg" height="55px" name="options" alt="Options">
</a>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/contributing.svg" height="55px" name="contributing" alt="Contributing">
</a>

Bug reports and pull requests are welcome on GitHub at https://github.com/[GITHUB_USERNAME]/[REPOSITORY_DEST]. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[GITHUB_USERNAME]/[REPOSITORY_DEST]/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/limitations.svg" height="55px" name="limitations" alt="Limitations">
</a>
- Test
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/credits.svg" height="55px" name="credits" alt="Credits">
</a>
- Test
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/license.svg" height="55px" name="license" alt="License">
</a>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/code-of-conduct.svg" height="55px" name="code-of-conduct" alt="Code of Conduct">
</a>
    
Everyone interacting in the [REPOSITORY_DEST] project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[GITHUB_USERNAME]/[REPOSITORY_DEST]/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img href="#table-of-contents" src="[GITHUB_RAW]/[GITHUB_USERNAME]/[REPOSITORY_ORIGIN]/main/docs/[REPOSITORY_DEST]/readme/headlines/support-my-work.svg" height="55px" name="support-my-work" alt="Support my Work">
</a>
    
Donate by [https://www.paypal.com](https://www.paypal.com/donate?hosted_button_id=XKYLQ9FBGC4RG)
