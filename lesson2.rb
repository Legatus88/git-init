filename = ARGV[0] || 'movies.txt' 

unless File.exist?(filename)
  puts 'file doesn\'t exist'
  exit
end

File.readlines('movies.txt').each do |line|
  result = line.split('|')
  if result[1].include? "Max"
    film_name = result[1]
    rate = result[7]   		
    x = (rate.to_f - 8.0) * 10.0
    stars = '*' * x.round
    puts film_name + ' ' + stars
  end
end