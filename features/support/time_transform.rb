CAPTURE_TIME = Transform /^\d+:\d{2}[a|p]m$/i do |time|
  time = Time.parse(time)
  Timecop.freeze time
end