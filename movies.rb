good_movie = 'Matrix'
bad_movie = 'Titanic'

if ARGV[0] == good_movie
	puts good_movie + ' is a good movie'
else
	if ARGV[0] == bad_movie
		puts bad_movie + ' is a bad movie'
	else 
		puts 'Haven\'t seen ' + ARGV[0] + ' yet.'
	end
end

