require "benchmark/ips"

class MutableHash

  def print(opts={})
    opts
  end
end

class ImmutableHash
  OPTS = {}.freeze

  def print(opts=OPTS)
    opts
  end
end

mutable = MutableHash.new
immutable = ImmutableHash.new


Benchmark.ips do |x|
  x.report("mutable") { mutable.print }
  x.report("immutable") { immutable.print }
  x.compare!
end
