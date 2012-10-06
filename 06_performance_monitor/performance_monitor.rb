def measure num = 1
  elapsed_time = 0
  num.times do
    start_time = Time.now
    yield
    elapsed_time += Time.now - start_time
  end
  elapsed_time / num
end