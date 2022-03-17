# Parser
Parse logs for a given log file and return the number of page visits and unique page views.

## How to use.

First make sure you have the correct ruby version specified in `.ruby-version`
and then install dependencies using
```shell
bundle install
```
Run the ruby script
```ruby
./parser <Your log file path> # example: ./parser webserver.log`
```


## Run tests
Current test coverage is 98.43%.
```shell
bundle exec rspec
```

## Approach

## Design Approach

1. Follow the extreme programming approach.
   Write test first and then let it fails write minimal code to pass then refactor it and again check if it pass.
   Then write next test and so on.

2. Divide the problem into separate concerns:
- `lib/web_log_parser/web_log_file.rb`: Responsible for reading the content and validating the  file.
- `lib/web_log_parser/page_views.rb`: Responsible for creating a data structure so I can get page visits and unique view efficiently.
- `lib/web_log_parser/view.rb`: Responsible for showing the view.
- `lib/web_log_parser.rb`: Responsible for being a single interface to build all object and perform the operation.

## What can be improved
- Naming. Like page views and views.
- View class can be write better so I dont have to pass the block for page visits an unique view.
