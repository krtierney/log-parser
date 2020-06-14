# log-parser

log-parser is a simple Ruby program which accepts a log file input and will
output some statistics based on the aggregated data contained within the log
file.

To run the program, first ensure the file input matches the expected format.
Each log entry should be on a new line, with a path and IP address source
separated by a space as in the included sample `webserver.log`. It would be 
nice to include some validations of the file input format, as well as more robust 
exception handling, in future iterations of this program.

First, install the dependencies. I've tried to keep it light, dependency-wise, so we're 
using MiniTest instead of RSpec. The program specifies ruby 2.7.1, but should run fine
on earlier Ruby versions if you change the Gemfile and .ruby-version files to point to 
the version of Ruby you'd like to use.

1. Ensure you have Ruby installed
2. Run `gem install bundler` if you don't have the bundler gem installed for your Ruby version yet
3. Run `bundle install` to install the Gemfile dependencies


Run the program with:
`ruby ./log_parser.rb $file`

Tests can be run with:
`bundle exec rake test`

Please note, this program should only be run with small log files and is limited
to working memory on the machine running it. If parsing of larger log files were
required, it would be preferable to sacrifice some degree of readability and use
Unix command line tools such as `awk` and `sort` in order to better utilise the 
disk instead of relying on in-memory sorting.


