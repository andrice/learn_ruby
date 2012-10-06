def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(word, t = 2)
  ((word + ' ') * t).chop
end

def start_of_word(word, num)
  word[0..num - 1]
end

def first_word(sentence)
  sentence.split.at(0)
end

def titleize(sentence)
  sentence.split.each_with_index { |word,i| word.capitalize! if (!%w(and over the).include?(word)) || (i == 0) }.join(' ')
end