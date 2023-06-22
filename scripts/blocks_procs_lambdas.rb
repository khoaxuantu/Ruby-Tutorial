def call_proc
    puts "Before proc"
    my_proc = Proc.new { return 2 }
    my_proc.call
    puts "After proc"
end

p call_proc
# Prints "Before proc" but not "After proc"

def return_binding
    foo = 100
    binding
end

# foo is available thanks to the binding, even though we are outside of the method
# where it was defined
puts return_binding.class
puts return_binding.eval('foo')