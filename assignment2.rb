# Create a program to analyze a large block of text and report back on the frequency of each word in the text.
# Start by sorting the text into a hash where each word is a key with the word's value being the amount of times
# it has been used in the block.
# Once you've created this hash, return the word that has been used the most.
# When you're done, encapsulate your script inside of a method that can analyze any block of text fed to it.



class WordCounter
  attr_reader :words, :frequency

  def initialize(content)
    @words = content.downcase.gsub(/[.,]/, '').split(' ')
  end

  def count
    word_frequency = Hash.new(0)

    words.each do |word|
      word_frequency[word] += 1
    end

    @frequency = word_frequency.sort_by {|key, value| value }.reverse.to_h

    return @frequency
  end

  def most_frequent_word
    frequency.first[0]
  end
end

puts "Please type your text here:"

text = gets.strip

word_counter = WordCounter.new(text)

puts word_counter.count

puts "#{word_counter.most_frequent_word} is the most frequently used word"