require "benchmark/ips"

def foo
  1
end

define_method(:foo1) do
  1
end

Benchmark.ips do |x|
  x.report("foo") { foo }
  x.report("foo1") { foo1 }
  x.compare!
end
