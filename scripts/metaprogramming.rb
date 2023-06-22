hr = "-------------------------------------------"

class Language
    def initialize(name, creator)
        @name = name
        @creator = creator
    end
end

ruby = Language.new("Ruby", "Matz")

pp ruby.class # Language
pp ruby.instance_variables # [:@name, :@creator]

puts hr

class String
    def logStr
        puts ">> #{self}"
    end
end

"Hello World".logStr # >> Hello World

puts hr

module Kernel
    def log(input)
        puts "Logging `#{input}` from #{self.inspect}"
    end
end

log "hello"

"hello".log("a")

String.log("temp")