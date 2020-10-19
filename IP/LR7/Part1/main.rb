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

  result = ''
  i = 0
  while (components1[i] == components2[i]) && (i < components1.size) && (i < components2.size)
    result += components1[i] + ' '
    i += 1
  end
  result
end

