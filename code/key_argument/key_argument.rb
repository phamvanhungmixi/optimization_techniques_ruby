require "benchmark/ips"

OPTS = {}.freeze

def faster(b: nil) b end

def slower(opts=OPTS)
  opts[:b]
end

def slowest(**opts)
  opts[:b]
end

def slowest1(b:nil)
  b
end

def slowest2(**opts)
  opts[:b]
end

Benchmark.ips do |x|
  x.report("faster") { faster(b: 1) }
  x.report("slower") { slower(b: 1) }
  x.report("slowest") { slowest(b: 1) }
  x.report("slowest1") { slowest1(**{b:1}) }
  x.report("slowest2") { slowest2(**{b:1}) }
  x.compare!
end
