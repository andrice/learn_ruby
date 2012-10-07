class Array
  def sum
    self.empty? ? 0 : self.reduce(0) { |s, item| s + item }
  end

  def square
    self.empty? ? self : self.map { |item| item**2 }
  end

  def square!
    self.empty? ? self : self.map! { |item| item**2 }
  end
end