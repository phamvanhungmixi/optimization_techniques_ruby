require 'benchmark/ips'

class AvoidNil
  def init_with_nil(value = false)
    init
    @iv = value
  end

  def init
    @iv = true
  end

  def init_without_nil(value = false)
    @iv = value
  end
end

a = AvoidNil.new


Benchmark.ips do |x|
  x.report('With nil') { a.init_with_nil(1) }
  x.report('Without nil') { a.init_without_nil(1) }
  x.compare!
end
