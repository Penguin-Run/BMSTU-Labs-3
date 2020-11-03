# frozen_string_literal: true
def create_file(file_name, str)
  File.open(file_name, 'w') do |f|
    f.puts(str)
  end
end

def find_equal_start(filename1, filename2)
  str1 = File.read filename1
  str2 = File.read filename2

  components1 = str1.split
  components2 = str2.split


  sorted_array = components1.zip(components2).take_while { |elem1, elem2| elem1 == elem2 }
  result = sorted_array.reduce('') do |str, elem|
    str + elem[0] + ' '
  end
  result
end

