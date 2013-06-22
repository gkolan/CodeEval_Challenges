#Challenge Link - https://www.codeeval.com/open_challenges/8/
#Score - 100
def reverse_words value
    return [] if value.empty?
    split_sentence = value.split(" ")
    reverse_words = split_sentence.reverse!
    make_sentense = reverse_words.join(" ")
    return make_sentense
end
File.open(ARGV[0]).each_line do |line|
    puts reverse_words(line)
end