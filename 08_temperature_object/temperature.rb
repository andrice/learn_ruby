class Temperature
  def initialize params
    params.each_key {|key| @type = key}
    params.each_value {|value| @value = value}
  end

  def in_fahrenheit
    @type == :f ? @value : ctof(@value)
  end

  def in_celsius
    @type == :c ? @value : ftoc(@value)
  end

  def self.from_celsius value
    self.new(:c => value)
  end

  def self.from_fahrenheit value
    self.new(:f => value)
  end

  private

  def ftoc f_value
    (5.0 * f_value - 160.0) / 9.0
  end

  def ctof c_value
    (9.0 / 5.0) * c_value + 32
  end
end

class Celsius < Temperature
  def initialize value
    @type = :c
    @value = value
  end
end

class Fahrenheit < Temperature
  def initialize value
    @type = :f
    @value = value
  end
end