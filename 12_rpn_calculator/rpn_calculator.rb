class RPNCalculator
  def initialize
    @stack = []
  end

  def push(num)
    @stack.push num
  end

  def plus
    perform_action(:+)
  end

  def minus
    perform_action(:-)
  end

  def divide
    perform_action(:/)
  end

  def times
    perform_action(:*)
  end

  def perform_action(action)
    @stack.length > 1 ? @stack.push(@stack.pop.send(action, @stack.pop.to_f)) : raise("calculator is empty")
  end

  def value
    @stack.last
  end

  def tokens(str)
    str.split.map { |item| item.match(/^[+*\/-]$/) ? item.to_sym : item.to_i }
  end

  def evaluate(str)
    str.split.each { |item| item.match(/^[+*\/-]$/) ? @stack.push(@stack.pop.send(item.to_sym, @stack.pop.to_f)) : @stack.push(item.to_i) }
    @stack.last
  end
end