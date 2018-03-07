#здесь важна последовательность?
filename = ARGV[0] || 'movies.txt' 

unless File.exist?(filename)
		puts 'file doesn\'t exist'
		exit
end

filename = File.open('movies.txt')
filename.each do |line|
	result = line.split('|')
	if result[1].include? "Max"
   		film_name = result[1]
   		rate = result[7]   		
   		x = (rate.to_f - 8.0) * 10.0
#округление здесь уместно?
   		stars = '*' * x.round
   		puts film_name + ' ' + stars
	end
end
filename.close