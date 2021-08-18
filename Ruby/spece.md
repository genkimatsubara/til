# Rubyの正しい書き方
# operators
```
# bad
sum=1+2
a,b=1,2
class FooError<StandardError;end

# good
sum = 1 + 2
a, b = 1, 2
class FooError < StandardError; end

# bad
e = M * c ** 2

# good
e = M * c**2

# bad
o_scale = 1 / 48r

# good
o_scale = 1/48r

# bad
foo &. bar
foo &.bar
foo&. bar

# good
foo&.bar

# bad
some( arg ).other
[ 1, 2, 3 ].each{|e| puts e}

# good
some(arg).other
[1, 2, 3].each { |e| puts e }

# bad
! something

# good
!something

# bad
1 .. 3
'a' ... 'z'

# good
1..3
'a'...'z'
```
# if
```
# bad - pretty convoluted
kind = case year
when 1850..1889 then 'Blues'
when 1890..1909 then 'Ragtime'
when 1910..1929 then 'New Orleans Jazz'
when 1930..1939 then 'Swing'
when 1940..1950 then 'Bebop'
else 'Jazz'
end

result = if some_cond
  calc_something
else
  calc_something_else
end

# good - it's apparent what's going on
kind = case year
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       else 'Jazz'
       end

result = if some_cond
           calc_something
         else
           calc_something_else
         end

# good (and a bit more width efficient)
kind =
  case year
  when 1850..1889 then 'Blues'
  when 1890..1909 then 'Ragtime'
  when 1910..1929 then 'New Orleans Jazz'
  when 1930..1939 then 'Swing'
  when 1940..1950 then 'Bebop'
  else 'Jazz'
  end

result =
  if some_cond
    calc_something
  else
    calc_something_else
  end
  

# bad
result = if some_condition then something else something_else end

# good
result = some_condition ? something : something_else
```

```
# bad
def some_method(arg1=:default, arg2=nil, arg3=[])
  # do something...
end

# good
def some_method(arg1 = :default, arg2 = nil, arg3 = [])
  # do something...
end

# bad
puts (x + y)

# good
puts(x + y)

# bad - parentheses are required because of op precedence
x = (not something)

# good
x = !something

# bad
if (x > 10)
  # body omitted
end

# good
if x > 10
  # body omitted
end

# bad
x = x + y
x = x * y
x = x**y
x = x / y
x = x || y
x = x && y

# good
x += y
x *= y
x **= y
x /= y
x ||= y
x &&= y
```
# hash
```
# bad
arr = Array.new
hash = Hash.new

# good
arr = []
arr = Array.new(10)
hash = {}
hash = Hash.new(0)

# bad
hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

# good
hash = { one: 1, two: 2, three: 3 }
```

```
# bad
name = "Bozhidar"

name = 'De\'Andre'

# good
name = 'Bozhidar'

name = "De'Andre"

# bad - uses DateTime for current time
DateTime.now

# good - uses Time for current time
Time.now

# bad - uses DateTime for modern date
DateTime.iso8601('2016-06-29')

# good - uses Date for modern date
Date.iso8601('2016-06-29')

# good - uses DateTime with start argument for historical date
DateTime.iso8601('1751-04-23', Date::ENGLAND)

# bad
if x % 2 == 0
end

if x % 2 == 1
end

if x == nil
end

# good
if x.even?
end

if x.odd?
end

if x.nil?
end

if x.zero?
end

if x == 0
end

```
