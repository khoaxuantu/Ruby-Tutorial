# Metaprogramming in Ruby
[Reference](https://www.akshaykhot.com/metaprogramming-ruby/)

## The Object model
Objects are part of a larger world that also includes other language constructs, such as classes,
modules, and instance variables. All of these constructs live together in a system called **the
object model**.

In most programming languages, language constructs like variables, classes, methods, etc... are
present while you are programming, but disappear before the program runs.'

In Ruby, most language constructs are still there. You can talk to them, query them, manipulate
them.
```rb
class Language
    def initialize(name, creator)
        @name = name
        @creator = creator
    end
end

ruby = Language.new("Ruby", "Matz")

pp ruby.class # Language
pp ruby.instance_variables # [:@name, :@creator]
```

## Open Classes
You can open any class and add new methods to it.
```rb
class String
    def log
        puts ">> #{self}"
    end
end

"Hello World".log # >> Hello World
```

## Instance variables vs Instance method
![](https://www.akshaykhot.com/content/images/size/w1000/2022/09/instance.png)

## Classes are Objects
Typically an OOP language

## What happens when you call a method?
1. Finds the method using *method lookup*. For this, Ruby interpreter looks into the *receiver's
class*, including the *ancestor chain*.
2. Execute the method using `self`.

The *receiver* is the object that you call a method on, e.g. in the statement 
`myObj.perform()`, `myObj` is the receiver.

The **ancestor chain** is the path of classes from a class to its superclass, until you reach
the root, i.e `BasicObject`

![](https://www.akshaykhot.com/content/images/2022/09/inheritance-chain.jpeg)

## The Kernel
The `Object` class includes `Kernel` module. Hence the methods defined in `Kernel`are available
to every object. In addition, each line in Ruby is executed inside a `main` object. Hence you can call
the `Kernel` methods such as `puts` from everywhere.

If you add a method to `Kernel`, it will be available to all objects, and you can call that method
from any where
```rb
module Kernel
    def log(input)
        puts "Logging `#{input}` from #{self.inspect}"
    end
end

log "hello"

"hello".log("a")

String.log("temp")
```

## The self Keyword
- `self` is constantly changing as a program executes.
- Only one object can be `self` at a given time.
- When you call a method, the receiver becomes `self`.
- All instance variables are instance variables of `self`, and all methods without an explicit
receiver are called on `self`.
- As soon as you call a method on another object, that other object (receiver) becomes `self`.

## Defining Classes and Methods Dynamically
```rb
Language = Class.new do
    define_method :interpret do
        puts "Interpreting the code"
    end
end
Language.new.interpret
```

## Calling Methods Dynamically
```rb
my_obj.send(:my_method, arg)
```

## Missing methods
When you call a method on an obj, the Ruby interpreter goes into the object's class and looks
for the instance method. If it can't find the method there, it searches up the ancestor chain
of that classm until it reaches `BasicObject`.

If it doesn't find the method anywhere, it calls a mehod named `method_missing` on the original
receiver, i.e the object.

The `method_missing` method is originally defined in the `BasicObject` class. However, you can 
override it in your class to intercept and handle unknown methods.
```rb
class Language
    def interpret
        puts "Interpreting"
    end
    def method_missing(name, *args)
        puts "Method #{name} doesn't exist on #{self.class}"
    end
end

ruby = Language.new
ruby.interpret
ruby.compile
```

## instance_eval
This `BasicObject#instance_eval` method evaluates a block in the context of an object.
```rb
class Language
    def initialize(name)
        @name = name
    end

    def interpret
        puts "Interpreting the code"
    end
end

puts "***instance_eval with object***"

ruby = Language.new "Ruby"

ruby.instance_eval do
    puts "self: #{self}"
    puts "instance variable @name: #{@name}"
    interpret
end

puts "\n***instance_eval with class**"

Language.instance_eval do
    puts "self: #{self}"

    def compile
        puts "Compiling the code"
    end

    compile
end

Language.compile
```

## Class Definitions
```rb
class MyClass
    puts "Hello from MyClass"
    puts self
end
```

### class_eval()
Evaluates a block in the context of an existing class. This allows you to reopen the class and
define additional behavior on it.
```rb
MyClass.class_eval do 
    def my_method
        puts "#{self}"
    end
end

MyClass.new.my_method
```

## Singleton Methods and Classes
You can define methods on individual objects, instead of defining them in the object's class
```rb
animal = "cat"

def animal.speak
    puts self
end

animal.speak
```
When you define the singleton method on the `animal` object, Ruby does the following:
1. Create a new anonymous class, also called a singleton/eigenclass.
2. Define the `speak` method on that class
3. Make this new class the class of the `animal` object
4. Make the original class of the object (String), the superclass of the singleton class.
```
animal -> Singleton -> String -> Object
```
> The superclass of the singleton class of an object is the object's class. The superclass of 
> the singleton class of a class is the singleton class of the class's superclass.