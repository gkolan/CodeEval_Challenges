#CodeEval Commuting Engineer Challenge
=begin
Question: 	https://www.codeeval.com/open_challenges/90/
Score   :	0
Error	: 	CodeEval Error: Process was aborted after 10 seconds 
=end

#Credits
=begin
	http://stackoverflow.com/questions/5582481/creating-permutations-from-a-multi-dimensional-array-in-ruby
	http://stackoverflow.com/questions/1502590/calculate-distance-between-two-points-in-google-maps-v3
=end

#Output on Computer
=begin
1 | CodeEval 1355 Market St, SF (37.7768016, -122.4169151)
2 | Zynga 699 8th St, SF (37.7706628, -122.4040139)
3 | Airbnb 99 Rhode Island St, SF (37.7689269, -122.4029053)
4 | Flurry 3060 3rd St, SF (37.7507903, -122.3877184)
5 | Dropbox 185 Berry St, SF (37.77688, -122.3911496)
6 | New Relic 188 Spear St, SF (37.7914417, -122.3927229)
7 | Yelp 706 Mission St, SF (37.7860105, -122.4025377)
8 | Mashery 717 Market St, SF (37.7870361, -122.4039444)
9 | Square 110 5th St, SF (37.7821494, -122.405896)
10 | Glassdoor 1 Harbor Drive, Sausalito (37.8672841, -122.5010216)
=end

$total_combinations =[]
$sizee = []
$calcuated_distance = []
$count = 1
#http://stackoverflow.com/questions/1502590/calculate-distance-between-two-points-in-google-maps-v3
def rad value
	return value/180 * Math::PI
end
def distance_between_2_coordinates (arr1, arr2)
  $R = 3961.3 #earth's mean radius in miles
  dLat  = rad(arr2[0] - arr1[0])
  dLong = rad(arr2[1] - arr1[1])

  a = Math::sin(dLat/2) * Math::sin(dLat/2) + Math::cos(rad(arr2[0]) * Math::cos(arr1[0])) * Math::sin(dLong/2) * Math::sin(dLong/2)
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  d = $R * c
  return d
end

def commute value
	temp_array = value.split(" | ")
	number = temp_array[0]
	name_location = temp_array[1].split(" (")
	name = name_location[0]
	latitude_logitude = name_location[1].split(",")
	latitude = latitude_logitude[0].to_f
	longitude = latitude_logitude[1].gsub(")","").to_f
	$total_combinations << [name,[latitude, longitude]]
end
File.open(ARGV[0]).each_line do |value|
    commute(value)
end
=begin
commute('1 | CodeEval 1355 Market St, SF (37.7768016, -122.4169151)')
commute('2 | Yelp 706 Mission St, SF (37.7860105, -122.4025377)')
commute('3 | Square 110 5th St, SF (37.7821494, -122.4058960)')
commute('4 | Airbnb 99 Rhode Island St, SF (37.7689269, -122.4029053)')
commute('5 | Dropbox 185 Berry St, SF (37.7768800, -122.3911496)')
commute('6 | Zynga 699 8th St, SF (37.7706628, -122.4040139)')
commute('7 | Mashery 717 Market St, SF (37.7870361, -122.4039444) ')
commute('8 | Flurry 3060 3rd St, SF (37.7507903, -122.3877184) ')
commute('9 | New Relic 188 Spear St, SF (37.7914417, -122.3927229) ')
commute('10 | Glassdoor 1 Harbor Drive, Sausalito (37.8672841, -122.5010216)')
=end
head, *tail = $total_combinations
head_permutation = tail.permutation.map { |e|   [head] + e}
final_path = tail.permutation.map { |e|  [head] + e}
head_permutation.each do |hp|
	while hp.size > 1
	$sizee << distance_between_2_coordinates(hp[0][1], hp[1][1])
	hp.shift
	end
	$calcuated_distance << $sizee.inject {|sum, n| sum + n}
	$sizee = []
end

index_for_min_distance = $calcuated_distance.index($calcuated_distance.min)
final_path[index_for_min_distance].each do |fp|
	puts "#{$count}" + " | " + fp[0].to_s + " (" + fp[1][0].to_s + ", " + fp[1][1].to_s + ")"
	$count = $count + 1
end