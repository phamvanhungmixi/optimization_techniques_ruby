require "benchmark/ips"

integer1 = lambda { |str| Integer(str) }
integer2 = Kernel.method(:Integer)
integer3 = Object.new
def integer3.call(str) Integer(str) end

integer4 = Object.new
class << integer4
  alias call Integer
  public :call
end

Benchmark.ips do |x|
  x.report("integer1") { integer1.call("1") }
  x.report("integer2") { integer2.call("1") }
  x.report("integer3") { integer3.call("1") }
  x.report("‌integer4") { integer4.call("1") }
  x.compare!
end
