# optimization_techniques_ruby
This documentation is inspired by this talk in rubykaigi 2019 http://code.jeremyevans.net/presentations/rubykaigi2019

#### How to run benchmark

```
➜  optimization_techniques_ruby git:(master) ✗ bundle install --path=vendor/bundle
Using rake 12.3.2
Using benchmark-ips 2.7.2
Using bundler 1.17.2
Bundle complete! 2 Gemfile dependencies, 3 gems now installed.
Bundled gems are installed into `./vendor/bundle`
➜  optimization_techniques_ruby git:(master) ✗ bundle exec ruby code/define_method/define_method_with_class.rb
Warming up --------------------------------------
         test_normal   446.454k i/100ms
       define_method   389.800k i/100ms
    test_eval_string   449.792k i/100ms
    class_eval_block   430.082k i/100ms
Calculating -------------------------------------
         test_normal     21.229M (± 3.9%) i/s -    106.256M in   5.013547s
       define_method     12.574M (± 3.5%) i/s -     63.148M in   5.028462s
    test_eval_string     21.608M (± 6.8%) i/s -    107.500M in   5.007247s
    class_eval_block     21.288M (± 3.3%) i/s -    106.660M in   5.015690s

Comparison:
    test_eval_string: 21608219.9 i/s
    class_eval_block: 21288171.4 i/s - same-ish: difference falls within error
         test_normal: 21228584.9 i/s - same-ish: difference falls within error
       define_method: 12574361.8 i/s - 1.72x  slower

➜  optimization_techniques_ruby git:(master) ✗
```
