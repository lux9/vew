require "open-uri"
require_relative "text_analyzer"

text = open("http://www.rubyinside.com/book/oliver.txt").read

p analyze(text)
