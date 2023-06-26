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
end

box = Box.new(10, 20)

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
