require './main.rb'
require 'minitest/autorun'
def generate_text(num_of_components)
  # words = %w[accommodate arm amount promote ring underline attack convict shop]
  words = %w[right left]
  random_file_text1 = ''
  random_file_text2 = ''
  output = ''
  is_first = true
  num_of_components.times do
    word1 = words[rand(0..words.size - 1)]
    word2 = words[rand(0..words.size - 1)]
    random_file_text1 += word1 + ' '
    random_file_text2 += word2 + ' '
    if (word1 == word2) && (is_first)
      output += word1 + ' '
    else is_first = false
    end
  end
  [random_file_text1, random_file_text2, output]
end
# Class for setting any tests on logic methods
class Tests < MiniTest::Test
  def setup; end

  def test_files
    100.times do
      random_strings = generate_text(5)
      create_file 'files/F.txt', random_strings[0]
      create_file 'files/G.txt', random_strings[1]

      File.open('files/H.txt', 'w') do |f|
        f.puts(find_equal_start('files/F.txt', 'files/G.txt'))
      end

      str_in_file = (File.read 'files/H.txt')
      output_str = random_strings[2]

      str_in_file = str_in_file[0...-1] # truncate \n
      assert_equal(str_in_file, output_str)
    end
  end

  def teardown; end
end

