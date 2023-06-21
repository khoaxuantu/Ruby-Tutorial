#!/usr/bin/ruby

hsh = colors = {
    "red" => 0xf00,
    "green" => 0xf00,
    "blue" => 0x00f
}

hsh.each do |key, value|
    print key, " is ", value, "\n"
end