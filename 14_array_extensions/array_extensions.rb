module ArrayExtensions
  def sum
    self.empty? ? 0 : self.reduce(0) { |s, item| s + item }
  end

  def square
    self.empty? ? self : self.map { |item| item**2 }
  end

  def square!
    replace(square)
  end
end

class Array
  include ArrayExtensions
end