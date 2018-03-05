white_list = ['The Divide', 'Matrix', 'Silent House', 'Saw']

kino = ARGV[0]

if white_list.include?(kino) 
	puts kino + ' is a good movie'
else puts kino + ' is not in my list'
end