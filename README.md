# log-parser

log-parser is a simple Ruby program which accepts a log file input and will
output some statistics based on the aggregated data contained within the log
file.

To run the program, first ensure the file input matches the expected format.
Each log entry should be on a new line, with a path and IP address source
separated by a space as in the included sample `webserver.log`. It would be 
nice to include some validations of the file input format, as well as more robust 
exception handling, in future iterations of this program.

After ensuring you have ruby 2.7.1 installed, run the program with:
`ruby ./log_parser.rb $file`

Test can be run with:
`bundle exec rake test`

Please note, this program should only be run with small log files and is limited
to working memory on the machine running it. If parsing of larger log files were
required, it would be preferable to sacrifice some degree of readability and use
Unix command line tools such as `awk` and `sort` in order to better utilise the 
disk instead of relying on in-memory sorting.


