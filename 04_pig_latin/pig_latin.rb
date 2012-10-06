def translate(sentence)
  sentence.split.map! { |word| word.match(/^[A-Z]/)? transform(word).downcase.capitalize : transform(word) }.join(' ')
end

def transform(word)
  if word.match(/[!,.?]$/)
    ending = word[-1]
    word = word[0, word.length - 1]
  else
    ending =''
  end

  if word.match(/^[aieou]/)
    word + 'ay'
  else
    consonants = word.split(/[aieou]/)[0]
    if consonants[-1] + word[consonants.length] == 'qu'
      word[consonants.length + 1, (word.length - consonants.length)] + consonants + 'uay' + ending
    else
      word[consonants.length, (word.length - consonants.length)] + consonants + 'ay' + ending
    end
  end

end