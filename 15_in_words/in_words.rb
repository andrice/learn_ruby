module NumInWordsExtension
  def set_consts
    @consts = { 1 => 'one',
                2 => 'two',
                3 => 'three',
                4 => 'four',
                5 => 'five',
                6 => 'six',
                7 => 'seven',
                8 => 'eight',
                9 => 'nine',
                10 => 'ten',
                11 => 'eleven',
                12 => 'twelve',
                13 => 'thirteen',
                14 => 'fourteen',
                15 => 'fifteen',
                16 => 'sixteen',
                17 => 'seventeen',
                18 => 'eighteen',
                19 => 'nineteen',
                20 => 'twenty',
                30 => 'thirty',
                40 => 'forty',
                50 => 'fifty',
                60 => 'sixty',
                70 => 'seventy',
                80 => 'eighty',
                90 => 'ninety'}
  end

  def in_words
    if self == 0
      'zero'
    else
      set_consts
      result_str = ''
      temp = self

      trillions = temp / 1000000000000
      result_str += "#{ decompose trillions } trillion " if trillions > 0

      temp -= trillions * 1000000000000
      billions = temp / 1000000000
      result_str += "#{ decompose billions } billion " if billions > 0

      temp -= billions * 1000000000
      millions = temp / 1000000
      result_str += "#{ decompose millions } million " if millions > 0

      temp -= millions * 1000000
      thousands = temp / 1000
      result_str += "#{ decompose thousands } thousand " if thousands > 0

      temp -= thousands * 1000
      hundreds = temp / 100
      result_str += decompose temp
      result_str.strip
    end
  end

  def decompose(num)
    res = ''
    if num > 99
      hundreds = num / 100
      num -= hundreds * 100
      res += "#{ @consts[hundreds] } hundred "
    end
    if @consts.member?(num)
      res += @consts[num]
    else
      tens = num / 10
      num -= tens * 10
      res += "#{ @consts[tens * 10] } #{ @consts[num] }"
    end
    res.strip
  end
end

class Integer
  include NumInWordsExtension
end