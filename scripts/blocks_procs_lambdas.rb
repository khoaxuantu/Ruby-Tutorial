def call_proc(my_lambda)
    count = 500
    my_lambda.call
end

count = 1
my_lambda = -> {
    puts count
}

p call_proc(my_lambda)
# Prints "Before proc" but not "After proc"

def return_binding
    foo = 100
    binding
end

# foo is available thanks to the binding, even though we are outside of the method
# where it was defined
puts return_binding.class
puts return_binding.eval('foo')
