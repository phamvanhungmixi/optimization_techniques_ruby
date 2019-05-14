require "benchmark/ips"

class Test

  # 通常のメソッド
  def test_normal
  end

  # define_method
  define_method :test_define_method do
  end

  # class_eval (文字列)
  class_eval <<-EOS, __FILE__, __LINE__ + 1
    def test_eval_string
    end
  EOS

  # class_eval (ブロック)
  class_eval do
    def test_eval_block
    end
  end
end

test = Test.new

Benchmark.ips do |x|
  x.report("test_normal") { test.test_normal }
  x.report("define_method") { test.test_define_method }
  x.report("test_eval_string") { test.test_eval_string }
  x.report("class_eval_block") { test.test_eval_block }
  x.compare!
end
