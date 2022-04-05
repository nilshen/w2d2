class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza","foodie","peggy"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true 
    else false
    end
  end

  def get_matching_indices(char)
    hash = Hash.new {|h,k|h[k]=[]}
    @secret_word.split("").each.with_index do |c, i|
      hash[c] << i
    end
  hash[char]
  end

  def fill_indices(char, arr)
    arr.each do |i|
      guess_word[i] = char
    end
    guess_word
  end

  def try_guess(char)
    if already_attempted?(char)
      print "That has already been attempted"
      return false
    end
    #!!! initially I though elsif not already attempted
    attempted_chars << char
    fill_indices(char,get_matching_indices(char))
    @remaining_incorrect_guesses -= 1 if get_matching_indices(char).empty? 
    true                    #!!! why indicate true?
  end

  def ask_user_for_guess
    print "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN!!!!" 
      return true
    end
    false
  end

  def lose? 
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
    puts @secret_word
    return true
    end
  false
  end

end
