# Ruby OOP

```rb
$GLOBAL_VAR
class Customer
    @@classVar # Like static var
    
    def initialize(id, name, addr)
        # Like this.var or self.var
        @instanceVarId = id     
        @instanceVarName = name
        @instanceVarAddr = addr
    end

    def method
        localVar = 0
        puts "An object method"
    end
end

cust1 = Customer. new
cust2 = Customer.new("2", "Tu", "Thuy Khue, Tay Ho")
```

## Polymorphism
```rb
class Box
    def initialize(w, h)
        @width, @height = w, h
    end

    # accessor methods
    def printWidth
        @width
    end

    def printHeight
        @height
    end

    # setter methods
    def setWidth=(value)
        @width = value
    end

    def setHeight=(value)
        @height = value
    end

    # make a method private
    def privateMethod
    end

    private :privateMethod

    # make a method proteted
    def protectedMethod
    end

    private :protectedMethod

end

def getData(box)
    x = box.printWidth
    y = box.printHeight
    
    puts "Width of the box is: #{x}"
    puts "Height of the box is: #{y}"
end

getData(box)

box.setWidth = 30
box.setHeight = 50

getData(box)
```

## Class Methods (Static method)
```rb
class Box
    @@count = 0
    def initialize(w, h)
        @width, @height = w, h
        @@count += 1
    end

    # Class method
    def self.printCount()
        puts "Box count is: #@@count"
    end
end
```

## to_s method
Like `__str__()` in `Python`

## Inheritance
```rb
class Box
end

class BigBox < Box
end
```

## Overriding
```rb
class Box
    # constructor method
   def initialize(w,h)
      @width, @height = w, h
   end
   # instance method
   def getArea
      @width * @height
   end
end

class BigBox < BOx
    # Override a method
    def getArea
        @area = @width * @height
        puts "Big box area is: #@area"
    end
end
```

## Operator overloading
```rb
class Box
    # constructor method
    def initialize(w,h)
        @width, @height = w, h
    end

    # Define + to do vector addition
    def +(other)
        Box.new(@width + other.width, @height + other.height)
    end

    # Define unary minus to negate width and height
    def -@
        Box.new(-@width, -@height)
    end

    # To perform scalar multiplication
    def *(scalar)
        Box.new(@width*scalar, @height*scalar)
    end
end
```

## Freezing objects
```rb
obj.freeze
```
- Turning an object into a constant

## Class constants
```rb
class Box
    BOX_COMPANY = "TATA Inc"
    BOXWEIGHT = 10
end
```

## Create obj using allocate
When you want to create an object without calling its constructor initialize
```rb
class Box
    def initialize(w, h)
        @width, @height = w, h
    end
end
obj = Box.allocate
```

