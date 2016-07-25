![a monkey typing][logo]
# Monkey Type!
a microgem to add a micro type system to ruby

# Why?
Adding just a bit of typing to ruby is just great. It makes you, as a programmer
have more control of what gets passed to your classes, methods or functions
and you know what your functions (and methods) returns.   
And crash earlier. ( thx "the pragmatic programmer" )   
Check out what [Matz says][matz_link]

# Why name it monkeyType?
Well. The gem is just a [elegant][ref_link] monkeyPatch of Object and Class classes.
And it does types.   
So... MonkeyTypes!

# Installation
```
gem install monkey_type
```

# Usage
well. I tried to simplify the usage as hard as i can.   
There is just two new things
to learn. the method *#is* and the class macro *contract*.   
the method is used like this:   
(remember to write **require 'monkey_type'**)

```ruby
require 'monkey_type'

def accepts_only_nums(num)
  num.is Numeric
  #things here
end
```


the method is will raise an exception if num isn't numeric or something like numeric.
Remember, we are duck typing here.
Simple isn't it?


```ruby
require 'monkey_type'

class Returner
  def return1
    1
  end

  def return2
    []
  end

  contract :return1, Numeric
  contract :return2, Array
end  
```

Remember to call *contract* **after** defining the methods.   
calling this contract will invoke metaprogramming deities and will ensure that the
method will return something like a Numeric in case of return1 and a Array in case of return2.
Also, you can call the functions on a typeless manner, just add **"\_typeless"** to the
end of the name of the method (like *return1_typeless*).


I have also included some types for your commodity.
if you want to check if something is a Numeric or nil use *option(Numeric)*
(you can change Numeric for Hash or even for you own class names)
if you want to check if something is true or false use *boolean*

```ruby
def i_accept_nil_or_array(t)
  t.is option(Array)
end

class Booled
  def i_return_true_or_false
    #boolean logic
  end

  contract :i_return_true_or_false, boolean
end
```
that is all.    

# Contributing
If you want to help focus on the method is_duck? and how to make easier to add
new "types" as Boolean or Option.
Or, make better error messages.    
Just send Pull Requests.

[logo]: https://upload.wikimedia.org/wikipedia/commons/9/93/Typing_monkey_768px.png
[matz_link]: https://www.omniref.com/blog/2014/11/17/matz-at-rubyconf-2014-will-ruby-3-dot-0-be-statically-typed/
[ref_link]: http://ruby-doc.org/core-2.1.1/doc/syntax/refinements_rdoc.html
