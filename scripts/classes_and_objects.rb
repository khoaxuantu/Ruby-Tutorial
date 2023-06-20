$GLOBAL_VAR = 10
class Customer
    @@classVar # Like static var
    
    def initialize(id, name, addr)
        # Like this.var or self.var
        @instanceVarId = id     
        @instanceVarName = name
        @instanceVarAddr = addr
    end

    def display_details()
        puts "Customer id #@instanceVarId"
        puts "Customer name #@instanceVarName"
        puts "Customer address #@instanceVarAddr"
    end    

    def method
        localVar = 0
        puts "An object method and a global var #$GLOBAL_VAR" \
        " and a local var #$localVar"
    end
end

cust2 = Customer.new("2", "Tu", "Thuy Khue, Tay Ho")
cust2.display_details

puts "\n"

cust2.method

Constant1 = 0

puts Constant1