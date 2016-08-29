A ruby2julia transpiler made with ❤️.

## Requirement

Ruby(MRI) 1.9.3 and up

## Installation

```
$ gem install julializer
```

## Usage

From your codebase:

```
require 'julializer'
Julializer.ruby2julia("3.5.round") # round(Int64,3.5)
```

Available from CLI too:

```
$ echo echo -1.6.to_i | julializer
trunc(Int64,parse(string((-1.6))));
$ cat sample.rb
for i in 0..list.size-1
  list[i] = (i-list.size/2).abs
end
$ julializer sample.rb
for i::Int64 = 0:size(list)[1]-1;list[i+1]=abs((i-size(list)[1]/2));;end;;
```

## Supported Classes and Syntax

As of v0.1.0, very limited number of classes and methods are supported as shown below.

- Supported Classes
  * Most methods are available
    * TrueClass, FalseClass, Fixnum, Float, integer, Numeric, Random
  * Very limited methods are available
    * Array, Range, Hash
- Supported Modules
  * Math
- Supported Syntax
  * `def`
  * `while`, `next`, `for`, `if..elsif..end`
  * global variable, constant

But there are very many differences between Ruby and Julia which I have no idea how to fix as of now. For example:

- Julia supports only `dec`, `bin` and `hex` format but in Ruby the decimal system is much powerful.(`#to_s(num)` and `#to_i(num)` are supported)
- Julia doesn't have Class concept(there is workaround though) but Ruby does
- [Julia does not have a "null" value](http://docs.julialang.org/en/release-0.4/manual/faq/#how-does-null-or-nothingness-work-in-julia) but Ruby does
  * For example in Ruby `[1,2,3].slice!(4)` will return null but in julia there is no nil therefore this raises causes error.
  * Current workaround for this is, do not write this way, instead you need to check boundary by yourself.
- And many more gaps to be solved
  * e.g.) In Julia `typemax()` and `typemin()` returns Inf but in Ruby `Float::MAX`, `Float::MIN` have specific value

For more information about what methods are available in detail, I'm still on a way to write spec and documentation. If anyone out there would want it early, it'd be more than helpful if you can join us by opening new issues for example. Your contribution is more than welcome all the time.

## License

MIT
