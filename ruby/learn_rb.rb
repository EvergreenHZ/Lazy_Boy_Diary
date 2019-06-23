'hello world'.slice(6)

:my_symbol == :my_symbol

# Data struct
numbers = ['zero', 'one', 'two', 'three']
numbers.push('four')
numbers.drop(2)

ages = 18..30
ages.entries
ages.include?(25)

fruit = { 'a' => 'apple',
          'b' => 'banana',
          :n  => 'nothing'
        }

add = -> x, y {x + y}
multiply = Proc.new { |x, y| x * y }
inc = lambda { |x| x += 1}

add.call(1, 2)
multiply.call(3, 4)

"hello.#{('dlrow'.reverse)}"

def foo(x)
  puts 'x * 10 is: #{x * 10}'
end

def join_with_commas(*words)
  words.join(',')
end

def v2_join_with_commas(first, *words, last)
  first + words.join(',') + last
end

first, *words, last = ['first', 'a', 'b', 'c', 'last']

def do_three_times
  yield
  yield
  yield
end

do_three_times {puts 'Hello'}

def do_again
  yield('first')
  yield('second')
end

do_again { |n| puts '#{n}: hello' }

def number_names
  [yield('one'), yield('two'), yield('three')].join(',')
end

number_names { |name| name.upcase.reverse }

(1..10).count { |n| n.even? }
(1..10).select { |n| n.even? }
# any?, all?, each?
(1..10).each do |n|
  if n.even?
    puts "#{n} is even"
  else
    puts "{n} is odd"
  end
end

(1..10).inject(0) { |result, n| result + n }
(1..10).inject(1) { |result, n| result * n }
(1..10).select(&:even?)
['one', 'two', 'three'].map(&:chars)

class Point < Struct.new(:x, :y)
  def +(p)
    Point.new(x + p.x, y + p.y)
  end

  def inspect
    "#<Point (#{x} #{y})"
  end
end

# Monkey patching
class Point
  def -(p)
    Point.new(x - p.x, y - p.y)
  end
end

