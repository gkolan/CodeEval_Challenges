#Challenge Link - https://www.codeeval.com/open_challenges/18/
#Score - 100
$two_power_numb = 1
def multiple_of_number value
    return [] if value.empty?
    number_array = value.split(",")
    value_check = number_array[0].to_i
    while $two_power_numb <= value_check
        $two_power_numb = $two_power_numb * 2
    end
    return $two_power_numb
end
File.open(ARGV[0]).each_line do |line|
    puts multiple_of_number(line)
end