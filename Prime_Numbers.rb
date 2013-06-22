#Challenge Link - https://www.codeeval.com/open_challenges/46/
#Score - 100
require 'prime'
def all_prime prime
    return [] if prime.empty?
    return Prime.take_while {|i| i < prime.to_i }.join(",")
end
File.open(ARGV[0]).each_line do |line|
    puts all_prime(line)
end