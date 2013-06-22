#Challenge Link - https://www.codeeval.com/open_challenges/89/
#Score - 0 Why? I used gready search to find the sum, it should be dynamic programming!
# Thank you! http://stackoverflow.com/questions/3538627/how-to-find-the-index-of-an-array-which-has-a-maximum-value

$serialized_array = []
$filtered_array = [] 
$count = 2
def passTriangle value
    return [] if value.empty?
	content_array = value.split(" ")
	$serialized_array << content_array
end
File.open(ARGV[0]).each_line do |line|
    passTriangle(line)
end
$filtered_array << $serialized_array[0][0]
arry = $serialized_array[1]
$filtered_array << arry[arry.map{|x| x.to_i}.index(arry.map{|x| x.to_i}.max)]
root = arry.map{|x| x.to_i}.index(arry.map{|x| x.to_i}.max)
while $count < $serialized_array.size
	arry = $serialized_array[$count]
	$filtered_array << arry[arry.map{|x| x.to_i}.index(arry[root..root+1].map{|x| x.to_i}.max)]
	root = arry.map{|x| x.to_i}.index(arry[root..root+1].map{|x| x.to_i}.max)
	$count = $count + 1
end 
puts $filtered_array.map{|x| x.to_i}.inject {|sum, n| sum + n }