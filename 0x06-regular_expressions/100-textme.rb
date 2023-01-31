#!/usr/bin/env ruby

text = ARGV[0]

match = text.scan(/(\[from:.*?\])|(\[to:.*?\])|(\[flags:.*?\])/i).flatten

from=match[0]
to=match[4]
flags=match[8]

from["[from:"]= ""
from["]"]= ""
to["[to:"] = ""
to["]"] = ""
flags["[flags:"]=""
flags["]"] = ""

print from,",",to,",",flags
puts ""
