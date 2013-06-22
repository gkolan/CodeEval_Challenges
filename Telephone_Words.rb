#Challenge Link - https://www.codeeval.com/open_challenges/59/
#Score - 100
$telephone = { "0" => "0", "1" => "1", "2" => "abc", "3" => "def", "4" => "ghi", "5" => "jkl", "6" => "mno", "7" => "pqrs", "8" => "tuv", "9" => "wxyz" }
def dial_text_permutations dial
    return [] if dial.empty?
    split_dial_array = dial.scan(/./)
	smart_tele_array = $telephone.collect { |k, v| [k,v.scan(/./)] }
	smart_tele_hash = Hash[smart_tele_array]
	permutation = split_dial_array.map{|i| smart_tele_hash[i]}.collect {|i| i}
	head, *rest = permutation
	return head.product(*rest).map {|i| i.join(",")}.map {|i| i.gsub(',','')}.join(",")
end
File.open(ARGV[0]).each_line do |line|
    puts dial_text_permutations(line)
end

