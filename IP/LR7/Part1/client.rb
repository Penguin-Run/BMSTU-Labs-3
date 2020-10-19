require './main.rb'

puts 'Input text for file F.txt'
arg1 = gets.chomp

puts 'Input text for file G.txt'
arg2 = gets.chomp

create_file 'files/F.txt', arg1
create_file 'files/G.txt', arg2
File.open('files/H.txt', 'w') do |f|
  f.puts(find_equal_start('files/F.txt', 'files/G.txt'))
end
