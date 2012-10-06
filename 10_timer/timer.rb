class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    time = @seconds
    secs = @seconds % 60
    time /= 60
    mins = time % 60
    time /= 60
    hours = time % 60
    [hours, mins, secs].map! { |part| padded part }.join(':')
  end

  def padded(value)
    "%02d" % value
  end
end