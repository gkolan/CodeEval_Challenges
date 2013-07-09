$ss = []
$vowels = ["a","e","i","o","u"]
$consonents = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]


def milo_score value
	content = value.downcase.split(";")
	peoples = content[0].split(",")
	products = content[1].split(",")

	products.each do |prod|
		product_split = prod.scan(/./).select { |x| x.match(/[a-z]/)}
		
		people = peoples[products.index(prod)]
		people_split = people.scan(/./).select { |x| x.match(/[a-z]/)}
		product_size = product_split.size
		puts "People Name: "+ people.to_s + " and " + people_split.to_s
		puts "Product Name: "+ prod.to_s + " and " + product_split.to_s
		
		if product_size.even?
			filter_array = people_split - (people_split - $vowels)
			gcd_value = product_split.size.gcd(people_split.size)
			puts "EVEN GCD " + " of " + "People: "+ people_split.size.to_s + " and " + "Product: " + product_split.size.to_s + " is " + gcd_value.to_s
			puts filter_array.to_s
			if gcd_value != 1
				$ss << ((filter_array.size * 1.5) * 1.5)
			else
				$ss << (filter_array.size * 1.5)
			end
		else
			filter_array = people_split - (people_split - $consonents)
			gcd_value = product_split.size.gcd(people_split.size)
			puts "ODD GCD " + " of " + "People: "+ people_split.size.to_s + " and " + "Product: " + product_split.size.to_s + " is " + gcd_value.to_s
			puts filter_array.to_s
			if  gcd_value != 1
				$ss << (filter_array.size * 1.5) 
			else
				$ss << filter_array.size
			end
		end
		puts
		puts
	end
	the_sum = $ss.flatten.map {|x| x.to_f}
	print the_sum
	puts
	total = the_sum.inject {|sum, value| sum + value} 
	return total
end

puts milo_score("Jack Abraham,John Evans,Ted Dziuba;iPad 2 - 4-pack,Girl Scouts Thin Mints,Nerf Crossbow")
puts milo_score("Jareau Wade,Rob Eroh,Mahmoud Abdelkader,Wenyi Cai,Justin Van Winkle,Gabriel Sinkin,Aaron Adelson;Batman No. 1,Football - Official Size,Bass Amplifying Headphones,Elephant food - 1024 lbs,Three Wolf One Moon T-shirt,Dom Perignon 2000 Vintage")