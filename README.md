This program was written as a solution for a coding challenge by London-based 
financial company. Their hiring process, as of early 2020, consisted of an 
interview with one of their internal recruiters, followed by submission of a 
solution for a coding challenge, to be completed in less than 2.5 hours. After 
that... I don't know, because they declined to continue the process based on this 
submission.

Below is the feedback I received from Smart Pension.

> Good
> 
> - Nicely written README and mentions using native command line tools like awk as 
an alternative (though doesn't say how)
> 
> Not so good
> 
> - Has used Minitest and not RSpec. Which I guess is fine; they have at least 
used an expectation format.
> - Not binary executable. They only needed to add a shebang to `log_parser.rb` - 
did they not know this?
> 
> Bad
> 
> - It's not really an OO solution; more a script split across three files.
> - `Parser` is rather confusing. It has a `logged_visits` method, which calls 
`build_logged_visits` and that method creates a local variable called 
`logged_visits`. In fact all the code in `Parser` is problematic one way or another.
> - `Stats` does at least separate the counting and ordering; but it is dependent on a `@logs`
instance variable provided by its includer. This could have easily been passed as a 
parameter instead.

Damn. Bit harsh, right? Granted, I don't think this is a perfect solution, but I was
surprised their reviewer could only find _one_ nice thing to say—and not even an
unqualified compliment at that ("though doesn't say how"). 

If your coding challenge has firm requirements in choice of testing framework or
entry point, that should be included in the spec provided to candidates. If you want
an executable, why not just ask for one up front? If you don't, you're filtering for 
candidates who have a prior knowledge of your assumptive expectation—this is a likely 
source of implicit bias in the hiring process. The phrase "did they not know this" is
condescending and needlessly cruel. (As well as inaccurate; had an executable been 
requested, providing one is certainly within my capability. As a hiring manager, it's
not something I ever cared much about, so I didn't think it wasn necessary since it wasn't 
specified.)

Although I generally have used RSpec in production professionally, for a toy app like 
this I may choose Minitest because it's a lighter framework and RSpec is overkill for 
this scenario. This is a choice that would, in my view, be suitable to discuss during 
an interview. "Which I guess is fine; they have at least used an expectation format" is
a needlessly antagonistic way of acknowledging that this is a matter of personal preference.

I won't debate the technical merits of the "Bad" feedback—suffice to say, I'm not a fast
coder, and with more than 2.5 hours I would likely have made a number of refactorings and 
improvements. But, using words like "problematic" shows a profound lack of respect for a 
candidate's time and interest. As feedback goes, it's not constructive, nor actionable. I'm
very grateful that they took the time to share this feedback with me, because I can confidently 
say that I wouldn't want to work on a team in which this is the standard of communication.


---

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


