require_relative "Anthill"
require 'optionparser'
options = {}
pritners = Array.new

ARGV << '-h' if ARGV.empty?
OptionParser.new do |opts|
    opts.banner = "Useage: ruby ants.rb [options]"
    opts.on("-w", "--width", Integer, "Width in lines of the Anthill") do |width|
        options[:width] = width
    end
    opts.on("-h", "--height", Integer, "Heigth in lines of the Anthill") do |height|
        options[:height] = height
    end
    opts.on("-a", "--ants", Integer, "Width in lines of the Anthill") do |ants|
        options[:ants] = ants
    end
    opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
    end 
    opts.on_tail()
end.parse!
    
anthill = AntHill.new(10,10,10)
anthill.fillAnthill()
loop do 
    anthill.printAnthill()
    sleep 0.2
    system 'clear'
end