puts defined? puts

def exampleMethod(var)
    puts "Var: #{var}"
end

puts defined? exampleMethod(bar)
exampleMethod(99)

puts defined? bar
bar = 33
puts defined? bar