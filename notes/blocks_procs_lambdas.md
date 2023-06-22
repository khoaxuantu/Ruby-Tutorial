# The Ultimate Guide to Blocks, Procs & Lambdas
[Reference](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/)

## Understanding Ruby Blocks
Blocks are enclosed in a `do / end` statement or between brackets `{}`.\
Example with `each`
```rb
[1,2,3].each { |num| puts num }

[1,2,3].each do |num|
    puts num
end
```
### Yield keyword
Yield is a keyword that calls a block when you use it.
```rb
def print_once
    yield
end

print_once { puts "Block is being run" }
```
### Implicit vs Explicit Blocks
```rb
def explicit_block(&block)
    block.call
end

explicit_block { puts "Explicit block called" }
```
### Check if a block was given
```rb
def blockSth
    return "No block given" unless block_given? 
        yield
end
```

## What is a Lambda?
A lambda is a way to define a block & its parameters with some special syntax.
You can save this lambda into a variable for later use
```rb
saySomething = -> { puts "This is a lambda" }
satSomething.call
saySomething.()
saySomething[]
saySomethong.===
```
Lambdas can also take arguments:
```rb
doubleNum = ->(x) { x*2 }
doubleNum.call(10)
# 20
```

## What is procs
Procs has a very similar concept with lambdas. A `lambda` is just a special `Proc` object.
```rb
myProc = Proc.new { |x| puts x }
```
A proc behaves differently than a lambda, specially when it comes to arguments:
```rb
t = Proc.new { |x,y| puts "I don't care about arguments!" }
t.call
# "I don't care about arguments!"
```
### Closures
A `proc` will carry with it values like local variables and methods from the context where
it was defined.

They don't carry the actual values, but a reference to them, so if the variables change after the
proc is created, the proc will always have the latest version.
```rb
def call_proc(my_proc)
    count = 500
    my_proc.call
end

count = 1
my_proc = Proc.new { puts count }

p call_proc(my_proc) # 1
```

## The binding class
Where do Ruby procs & lambdas store this scope information?

We'll talk about the `Binding` class...

When you create a `Binding` object via the `binding` method, you are creating an 'anchor' to this
point in the code.

Every variables, method & class defined at this point will be available later via this object, 
even if you are in a completely different scope.
```rb
def return_binding
    foo = 100
    binding
end

# foo is available thanks to the binding, even though we are outside of the method
# where it was defined
puts return_binding.class
puts return_binding.eval('foo')

# If you try to print foo directly you will get an error.
# The reason is that foo was never defined outside of the method.
puts foo
```
