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

### Pseudo-Variables
- Special variables that have appearance of local variables but behave like constants.
    + `self` 
    + `true`
    + `false`
    + `nil` - representing undefined
    + `__FILE__` - The name of the current source file
    + `__LINE__` - The current line number in the source file

### Basic Literals
- Integer
- Floating numbers
- String literals
    + Escape: `\\`, `\'`
- Backslash Notations

| Notation  | Character represented                             |
| --------- | ------------------------------------------------- |
| \n        | Newline (0x0a)                                    |
| \r        | Carriage return (0x0d)                            |
| \f        | Formfeed (0x0c)                                   |
| \b        | Backspace (0x08)                                  |
| \a        | Bell (0x07)                                       |
| \e        | Escape                                            |
| \s        | Space (0x20)                                      |
| \nnn      | Octal notation (n being 0-7)                      |
| \xnn      | Hexadecimal notation (n being 0-9, a-f, or A-F)   |
| \cx, \C-x | Control-x                                         |
| \M-x      | Meta-x (c | 0x80)                                 |
| \M-\C-x   | Meta-Control-x                                    |
| \x        | Character x                                       |

- Arrays
- Hashes (hashed table)
```rb
hsh = colors = {
    "red" => 0xf00,
    "green" => 0xf00,
    "blue" => 0x00f
}

hsh.each do |key, value|
    print key, " is ", value, "\n"
end
```
- Ranges - a range represents an interval which is a set of values with a start and an end, may be
constructed using the s..e and s...e literals, or with Range.new
```rb
#!/usr/bin/ruby

(10..15).each do |n|
    print n, ' '
end
```

### Operators
- **Arithmetic**\
`+`, `-`, `*`, `/`, `%`, `**` (exponent, 2**10)
- **Comparison**\
`==`, `!=`, `>`, `<`, `>=`, `<=`\
`<=>` Combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is 
greater than the second and -1 if first operand is less than the second.\
`===` Used to test quality within a when clause of a case statement.\
`eql?` True if the receiver and arg have both the same type and equal values.
`equal?` True if the receiver and argument have the same object id.
- **Assignment**\
`=`, `+=`, `*=`, `/=`, `%=`, `**=`
- **Paralled Assignment** - like `Python`
- **Bitwise**
```
a    =  0011 1100
b    =  0000 1101
-----------------
a&b  =  0000 1100
a|b  =  0011 1101
a^b  =  0011 0001
~a   =  1100 0011
a<<2 =  1111 0000
a>>2 =  0000 1111
```
- **defined?**
```rb
defined? variable
defined? method(bar)
defined? super 
defined? yield
```
- **Double Colon :**\
A unary operator to be accessed from anywhere outside the class or module.
```rb
MR_COUNT = 0            # constant defined on main Objectclass
module Foo
    MR_COUNT = 0
    ::MR_COUNT = 1      # set global count on 1
    MR_COUNT = 2        # set local count to 2
end
puts MR_COUNT           # this is the global const
puts Foo::MR_COUNT     # this is the local "Foo" const
```

## if...else, case, unless
### if...else
```rb
if contidtional
    code...
elsif conditional
    code...
else
    code...
end
```
```rb
code if condition
```
### unless
Like `if not` in `Python`
```rb
unless conditional
    code
else
    code
end
```
### case
```rb
case expression
when expr1, expr2
    statement1
when expre3, expr4
    statement2
else
    statement3
end
```

## Loops
### while
```rb
while conditional do
    code
end
```
```rb
code while condition
```
```rb
begin
    code
end while conditional
```
### until
```rb
until conditional do
    code
end
```
```rb
code until conditional
```
```rb
begin
    code
end until conditional
```
### for
```rb
for variable in expression
    code
end
```
### break
Like others' `break`

### next
Line others' `continue`

### redo
Restart the iteration

### retry
```rb
begin
    do_sth
rescue
    # handles error
    retry # restart from beginning
end

for i in 1...5
    retry if some_conditions # restartfrom i == 1
end
```

## Methods
```rb
def method_name(arg=default, *arg, &block)
    expr...
    return val
end
```
### alias
This gives alias to methods or global variables. Aliases cannot be defined within the method body.
```rb
alias foo bar
alias $MATCH $&
```
### undef
This cancels the method definition
```rb
undef methodName
```

## Blocks
A block consists of chunks of code
> Like `{data => doSth(data)}` in JavaScript
```rb
block_name {
    statement1
    statement2
    ...
}
```
### yield Statement
```rb
def test
    yield 5
    puts "You are in the method test"
    yield 100
end
test {|i| puts "You are in the block #{i}"}

def test1(&block)
    block.call
end
test {puts "Hello World!"}
```

## Modules and Mixins
```rb
module Identifier
    statement1
    statement2
    ..........
end
```
### require
Like others' `import`, `include`, `require()`
```rb
require 'file1.rb'
require 'file2'
```
### include
To embed a module in a class, use `include`
```rb
include modulename
```
### Mixins
```ruby
module A
    def a1
    end
    def a2
    end
end
module B
    def b1
    end
    def b2
    end
end

class Sample
include A
include B
    def s1
    end
end

samp = Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
```

## Strings
### Character encoding
```rb
$KCODE = 'a' # ASCII
$KCODE = 'e' # EUC
$KCODE = 'n' # None (same as ASCII)
$KCODE = 'u' # UTF-8
```
### Built-in methods
[Reference @@](https://www.tutorialspoint.com/ruby/ruby_strings.htm)

## Arrays
```rb
arr = Array.new
arr = Array.new(20)
```
- Size
```rb
arr.size
arr.length
```
- Use a block with new, populating each element with what the block evaluates to
```rb
nums = Array.new(10) {|e| e = e * 2}
puts "#{nums}" # 0,2,4,6,8,10,12,14,16,18
```
- Other ways to create a new array
```rb
nums = Array.[](1,2,3,4,5)
nums = Array.[1,2,3,4,5]
```
### Built-in methods
[Reference @@](https://www.tutorialspoint.com/ruby/ruby_arrays.htm)

## Hashes
```rb
map = Hash.new

# Create a hash with a default value
map = Hash.new("Key")
map = Hash.new "Key"
```
- If the key or value doesn't exist, accessing the hash will return the default value

### Built-in methods
[Reference @@](https://www.tutorialspoint.com/ruby/ruby_hashes.htm)

## Date & Time
### Current date and time
```rb
time1 = Time.new
time2 = Time.now
```
### Components of a Date & Time
```rb
time = Time.new

# Components of a Time
puts "Current Time : " + time.inspect
puts time.year    # => Year of the date 
puts time.month   # => Month of the date (1 to 12)
puts time.day     # => Day of the date (1 to 31 )
puts time.wday    # => 0: Day of week: 0 is Sunday
puts time.yday    # => 365: Day of year
puts time.hour    # => 23: 24-hour clock
puts time.min     # => 59
puts time.sec     # => 59
puts time.usec    # => 999999: microseconds
puts time.zone    # => "UTC": timezone name
```

### Time.utc, .gm and .local
```rb
# July 8, 2008
Time.local(2008, 7, 8)  
# July 8, 2008, 09:10am, local time
Time.local(2008, 7, 8, 9, 10)   
# July 8, 2008, 09:10 UTC
Time.utc(2008, 7, 8, 9, 10)  
# July 8, 2008, 09:10:11 GMT (same as UTC)
Time.gm(2008, 7, 8, 9, 10, 11)  
```
Format
```
[sec,min,hour,day,month,year,wday,yday,isdst,zone]
```

### Formatting Times and Dates
```rb
time = Time.new
puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y-%m-%d %H:%M:%S") # Formatting directives
```

### Arithmetic
```rb
now = Time.now
past = now - 10 # 10 seconds ago
future = now + 10 # 10 second later
diff = future - past
```

## Ranges
### Ranges as sequences
```rb
(1..5)
(1...5)
('a'..'d')
```
- Convert a range to a list
```rb
$, = ", "
range1 = (1..10).to_a
range2 = ('bar'..'bat').to_a
```
- Ranges immplement methods that let you iterate over them and test their contents
```rb
digits = 0..9

puts digits.include?(5)
ret = digits.min
ret = digits.max
ret = digits.reject {|i| i < 5}

digits.each do |digit|
    puts digit
end
```

### Ranges as conditions
```rb
while gets
    print if /start/../end/
end

score = 70
result = case score
    when 0..40 then "Fail"
    when 41..60 then "Pass"
    when 61..70 then "Pass with Merit"
    when 71..100 then "Pass with Distinction"
    else "Invalid Score"
end
```

### Ranges as intervals
```rb
if ((1..10) === 5)
    puts "5 lies in (1..10)"
end

if (('a'..'j') === 'c')
    puts "c lies in ('a'..'j')"
end

if (('a'..'j') === 'z')
    puts "z lies in ('a'..'j')"
end
```

## Iterators
### each
```rb
collection.each do |variable|
    code
end
```
### collect
```rb
# All the elements of a collection
collection = collection.collect
```
> The *collect* method is not the right way to do copying between arrays.

## FIle I/O
### puts Statement
It instructs the program to display the value stored in the variable

### gets Statement
It can be used to take any input from the user from standard screen called STDIN.
```rb
puts "Enter a value:"
val = gets
puts val
```

### putc Statement
It can be used to output one character at a time
```rb
str = "Hello Ruby!"
putc str # H
```

### print Statement
It is like the *puts* statement. The only difference is that the puts statement goes to the next
line after printing the contents, whereas with the print statement the cursor is positioned on the
same line
```rb
print "Hello world"
print "Good morning"

# Hello WorldGood morning
```

### File handler
#### File.new 
```rb
aFile = File.new("filename", "mode")
    # ...process the file
aFile.close
```
#### File.open
```rb
File.open("filename", "mode") do |aFile|
    # ...process the file
end
```
#### sysread
```rb
aFile = File.new("input.txt", "r")
if aFile
    content = aFile.sysread(20) # read the first 20 chars
else 
    puts "Unable to open file"
end
```
#### syswrite
```rb
aFile.syswrite("ABCDEF")
```
#### each_byte
It is always associated with a block
```rb
aFile.each_byte {|ch| putc ch; putc ?.}
```
#### IO.readlines 
```rb
arr = IO,readlines("input.txt")
puts arr[0]
puts arr[1]
```
#### IO.foreach
```rb
IO.foreach("input.txt"){|block| puts block}
```
#### Renaming and Deleting
```rb
File.rename("file1.txt", "file2.txt")

File.delete("file3.txt")
```
#### Modes and Ownership
```rb
file = File.new("text.txt", "w")
file.chmod(0755)
```
[Reference for chmod](https://www.tutorialspoint.com/ruby/ruby_input_output.htm)
#### File inquiries
```rb
File.open("file.rb") if File::exists?("file.rb")

# Return true/false whether the file is really a file
File.file?("text.txt")

# Check a directory
File::directory?("/a/directory") # true
File::directory?("file.rb") # false

# Check if a file has zero size
File.zero?("test.txt")

# Return size of a file
File.size?("text.txt")

# Return the type of a file
File::ftype("text.txt") # file

# Check when a file was created, modified, or last accessed
File::ctime("text.txt")
File::mtime("text.txt")
File::atime("text.txt")
```

### Directories
- Current directory
```rb
Dir.pwd
```
- Change directory
```rb
Dir.chdir("/to/destination/dir")
```
- Get a list of the files and directories within a specific directory
```rb
Dir.entries("/a/directory") # an array 
Dir.foreach("/a/directory") do |entry|
    puts entry
end
```
- Create a directory
```rb
Dir.mkdir("newdir")

# Set permissions
Dir.mkdir("newdir", 755)
```
- Delete a directory
```rb
Dir.delete("/a/deleting/directory")
```

### Tenporary Files and Directories
```rb
require 'tmpdir'
    tempfilename = File.join(Dir.tmpdir, "tingtong")
    tempfile = File.new(tempfilename, "w")
    tempfile.puts "This is a temporary file"
    tempfile.close
    File.delete(tempfilename)

require 'tempfile'
    f = Tempfile.new('tingtong')
    f.puts "Hello"
    puts f.path
    f.close
```

## Exceptions
```rb
begin   # try
    code
rescue FirstException => e # catch
    code
rescue SecondException => e
    code
else
    # Other exeptions
    code
ensure  # finally
    # Always will be executed 
    code
end
```
### raise
```rb
raise

OR

raise "Error message"

OR

raise ExceptionType, "Error message"

OR

raise ExceptuinType, "Error message" condition
```
### Catch and Throw
```rb
throw :lablename
#.. this will not be executed
catch :lablename do
#.. matching catch will be executed after a throw is encountered
end

OR

throw :lablename condition
#.. this will not be executed
catch :lablename do
#.. matching catch will be executed after a throw is encountered
end
```