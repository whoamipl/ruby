require 'time'
class AntHill
    def initialize(x,y,antAmout)
        @hill = Array.new(x) { Array.new(y)}
        @antAmout = antAmout
    end

    def fillAnthill() 
        (0..@hill.length - 1).each do |row|
            (0..@hill[0].length - 1).each do |col|
                @hill[row][col] = ' '
            end
        end
    end

    def printAnthill()
        cord = getRandomCord()
        @hill[cord[0]][cord[1]] = 'm'
        @hill.each { |x|
            puts x.join(" ")
        }
        print("\r")
        @hill[cord[0]][cord[1]] = '*'
    end

    def getRandomCord() 
        r = Random.new
        return r.rand(0..9), r.rand(0..9)
    end
end