def analyze(text)
  return {} if text.empty?

  output = text_stats(text)
  output[:average_words_per_sentence]       = output[:word_count].fdiv(output[:sentence_count]).round(2)
  output[:average_sentences_per_paragraph]  = output[:sentence_count].fdiv(output[:paragraph_count]).round(2)
  output
end

def text_stats(text)
  {
    character_count:                   text.length,
    character_count_excluding_spaces:  text.gsub(/\s/, '').size,
    line_count:                        text.scan(/^.*$/).size,
    word_count:                        text.scan(/\w+/).size,
    sentence_count:                    text.split(".").size,
    paragraph_count:                   text.split("\n\n").size # use double quotes here, doesn't work with '\n\n',
  }
end
