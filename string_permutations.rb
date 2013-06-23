#CodeEval Commuting Engineer Challenge
=begin
Question: 	https://www.codeeval.com/open_challenges/14/
Score   :	50
=end

def string_permutations value
	 return [] if value.empty?
	scan_value = value.scan(/./)
	return scan_value.permutation.map { |e| [e.join(",")]}.map { |e| e[0].gsub("\"","").gsub(",","")}.join(",")
end

File.open(ARGV[0]).each_line do |value|
    puts string_permutations(value)
end

#puts string_permutations('abc')