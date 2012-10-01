def add (a, b)
  sum = 0
  sum += a + b
end

def subtract (a, b)
  subtr = 0
  subtr += a - b
end

def sum (arr)
  s = 0
  arr.each {|item| s += item}
  s
end

def multiply(*numbers)
  numbers.inject(1) {|product,number| product *= number}
end

def pow (a, b)
  a ** b
end

def fact (num)
  num > 1 ? num * fact(num - 1) : 1
end