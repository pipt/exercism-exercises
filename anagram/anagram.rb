class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    prune_identical_words(words).select(&method(:same_letters?))
  end

private
  attr_reader :word

  def prune_identical_words(words)
    words.delete_if { |possible_match| possible_match.downcase == word }
  end

  def same_letters?(possible_match)
    possible_match.downcase.chars.sort == word.chars.sort
  end
end
