# MdlSearch

this gem helps you to search [material design icon](https://design.google.com/icons/).




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mdl_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mdl_search

## Usage

### 1. search icon
```bash
$ mdl_search search --name [name] --group [group_name] --keywords [keyword are array]

# ex
$ mdl_search search --name bright --group device --keywords low auto

# brightness auto               group: device
# brightness low                group: device
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vsanna/mdl_search. 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

