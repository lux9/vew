def roman_to_integer(roman_string)
  number = 0
  until roman_string.size.zero?
    if ROMAN_TO_INT.key?(roman_string.slice(-2, 2))
      number += ROMAN_TO_INT[roman_string.slice(-2, 2)]
      roman_string.chop!
    else
      number += ROMAN_TO_INT[roman_string.slice(-1)]
    end
    roman_string.chop!
  end
  number
end
# rubocop:enable Metrics/MethodLength
ROMAN_TO_INT = {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000
}
