require "morse"

def decode(morse_text)
  # TODO: Decode the morse text you just got!
  morse_text.split("|").map { |morse_word| decode_word(morse_word) }.join(" ")
end

def decode_word(morse_word)
  morse_word.split(" ").map { |morse_letter| MORSE.key(morse_letter) }.join
end
