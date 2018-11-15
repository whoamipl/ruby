require_relative "Anthill"

anthill = AntHill.new(10,10,10)
anthill.fillAnthill()
loop do 
    anthill.printAnthill()
    sleep 0.2
    system 'clear'
end