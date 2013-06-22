#Challenge Link - https://www.codeeval.com/open_challenges/21/
#Score - 100
def sum_of_digits value
    return [] if value.empty?
    split_number = value.scan(/./).map {|x| x.to_i}
    digits_sum = split_number.inject {|sum, el| sum + el}
    return digits_sum
end
File.open(ARGV[0]).each_line do |line|
    puts sum_of_digits(line)
end