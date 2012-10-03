def translate word
  if word.match(/^[aieou]/)
    word + "ay"
  else
    word[1..-1] + word[0].chr + "ay"
  end
end