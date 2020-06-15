# log-parser

log-parser is a simple Ruby program which accepts a log file input and will
output some statistics based on the aggregated data contained within the log
file.

## Setup

First, install the dependencies. I've tried to keep it light, dependency-wise, so we're 
using MiniTest instead of RSpec. The program specifies ruby 2.7.1, but should run fine
on earlier Ruby versions if you change the Gemfile and .ruby-version files to point to 
the version of Ruby you'd like to use.

1. Ensure you have Ruby installed
2. Run `gem install bundler` if you don't have the bundler gem installed for your Ruby version yet
3. Run `bundle install` to install the Gemfile dependencies

## Running the program

No binary executable has been included, so you'll need to run the program with `ruby`. 
Include a logfile as an argument, separated with a single space:

`ruby log_parser.rb $file`, e.g. `ruby log_parser.rb webserver.log`

## Tests

Tests can be run with:
`bundle exec rake test`

SimpleCov is enabled for the test suite to verify test coverage.
`rubocop` can also be run to verify style consistency.

## Limitations

To run the program, first ensure the file input matches the expected format.
Each log entry should be on a new line, with a path and IP address source
separated by a space as in the included sample `webserver.log`. It would be 
nice to include some validations of the file input format, as well as more robust 
exception handling, in future iterations of this program.

Please note, this program should only be run with small log files and is limited
to working memory on the machine running it. If parsing of larger log files were
required, it would be preferable to sacrifice some degree of readability and use
Unix command line tools such as `awk` and `sort` in order to better utilise the 
disk instead of relying on in-memory sorting.


