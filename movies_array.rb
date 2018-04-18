white_list = ['The Divide', 'Matrix', 'Silent House', 'Saw']

if white_list.include?(ARGV[0]) 
	puts ARGV[0] + ' is a good movie'
else puts ARGV[0] + ' is not in my list'
end