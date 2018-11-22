require_relative "Anthill"
require 'optionparser'
require 'ansi/code'
options = {}
pritners = Array.new

ARGV << '-h' if ARGV.empty? 
OptionParser.new do |opts|
    opts.banner = "Useage: ruby ants.rb [options]"
    opts.on("-w", "--width WIDTH", Integer, "Width in lines of the Anthill") do |width|
        options[:width] = width
    end
    opts.on("-y", "--height WIDTH", Integer, "Heigth in lines of the Anthill") do |height|
        options[:height] = height
    end
    opts.on("-a", "--ants AMOUNT", Integer, "Width in lines of the Anthill") do |ants|
        options[:ants] = ants
    end
    opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
    end
end.parse!

puts options
anthill = AntHill.new(options[:width], options[:height], options[:ants])
puts ANSI::Code.on_white
puts ANSI::Code.bold
anthill.fillAnthill()
loop do 
    anthill.printAnthill()
    sleep 0.5
    system 'clear'
end