class Book
  attr_accessor :title

  def title=(str)
    @title = str.split.each_with_index { |word,i|
      word.capitalize! if (!%w(and over the in of a an).include?(word)) || (i == 0) }.join(' ')
  end
end