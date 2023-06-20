# Ruby Fundamentals

## Syntax
### Whitespace in Ruby Program
- Whitespace characters are generally ignored, except when they appear
in strings.
> Sometimes thay are used to interpret ambiguous statements
```
a + b --> a+b (local var)
a  +b --> a(+b) (method call)
```

### Line endings
- Semicolons and newline characters.
- If Ruby encounters operators ore backslash ata the end of a line, 
they indicate the continuation of a statement.

### Here Document
- "Here Document" refers to build strings from multiple lines.
```rb
#!/usr/bin/ruby -w

print <<EOF
    This is the first way of creating 
    here document ie. multiple line string.
EOF

print <<"EOF";
    This is the second way of creating 
    here document ie. multiple line string.
EOF

print <<`EOC`;  # execute commands
    echo hi there.
    echo lo there.
EOC

print <<"foo", <<"bar"  # you can stack them
    I said foo.
foo
    I said bar.
bar
```

### BEGIN
Declares *code* to be called before the program is run.
```rb
BEGIN {
    code
}
```

### END
Declares *code* to be called at the end of the program.
```rb
END {
    code
}
```

### Comments
```rb
# A comment

=begin
A block comment
=end
```

## Classes and Objects
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

## Variables, Constants and Literals
### Variables
```rb
$globalVar
@@classVar
@instanceVar
localVar # first letter needs to be lowercase or _
```

### Constants
```rb
Constant # begin with an uppercase letter
```
> Constants defined within a class or module can be accessed from 
> within that class or module, and those defined outside a class or module
> can be accessed globally.

