#Challenge Link - https://www.codeeval.com/open_challenges/10/
#Score - 66.67
def mth_to_last content
    return [] if content.empty?
	content_array = content.split(" ")
	return [] if content_array.empty?
	clipped_content = content_array.first(content_array.size - 1)
	return [] if clipped_content.empty?
	content_size = clipped_content.size
	value = content_array[-1].to_i
	if content_size > value
		return clipped_content[value]
	else
		return clipped_content[0]
	end
end
File.open(ARGV[0]).each_line do |line|
    puts mth_to_last(line)
end