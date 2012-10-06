def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  arr.inject(0) { |s,number| s += number }
end

def multiply(*numbers)
  numbers.inject(1) { |product,number| product *= number }
end

def pow(a, b)
  a**b
end

def fact(num)
  num > 1 ? num * fact(num - 1) : 1
end