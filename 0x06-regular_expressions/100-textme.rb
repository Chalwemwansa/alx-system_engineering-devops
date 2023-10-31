#!/usr/bin/env ruby
#gets data from a list of data froma log file from a company

regex = /\[from:(.+?)\] \[to:(.+?)\] \[flags:(.+?)\]/
if ARGV.length == 1
  string = ARGV[0]
  matches = regex.match(string)
  if matches
    print "#{matches[1]}"
    print ",#{matches[2]}"
    puts ",#{matches[3]}"
  else
    puts "not found"
  end
end
