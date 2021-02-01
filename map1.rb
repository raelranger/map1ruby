require 'ruby2d'
require 'csv'

def find_y(lat)
    return(1962 - 94.6961 * lat)
end

def find_x(lng)
    return(-8584 + 91.28256 * lng)
end

@img = Image.new("mapth2.png", x:0,y:0)

keymappts = CSV.read("keymappts.csv", headers: true, header_converters: :symbol, converters: :all)


keymappts.each do |p|
    Circle.new(x:find_x(p[:lng]), y:find_y(p[:lat]), radius: 5, color: "red")
end

flight_log = CSV.read("flightpts.csv", headers: true, header_converters: :symbol, converters: :all)


flight_log.each do |f|
    Circle.new(x:find_x(f[:lng]), y:find_y(f[:lat]), radius: 2, color: "white")
end

set(width: 918, height: 786, background: "blue")

show
