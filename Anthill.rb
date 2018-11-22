require 'time'
require 'ansi/code'

class AntHill
    @@ant = "\u{1F41C}"

    def AntHill.ant 
        @@ant
    end

    def initialize(x,y,antAmout)
        @hill = Array.new(x) { Array.new(y)}
        @antAmout = antAmout
        @x = x
        @y = y
    end

    def fillAnthill() 
        (0..@hill.length - 1).each do |row|
            (0..@hill[0].length - 1).each do |col|
                @hill[row][col] = " "
            end
        end
    end

    def printAnthill()
        oldCords = {}
        fillAnthill()
        (0..@antAmout - 1).each do |i|
            cord = getRandomCord()
            oldCords[i] = cord
            @hill[cord[0]][cord[1]] = ANSI::Code.red + AntHill.ant.encode('UTF-8')
        end
        @hill.each { |x|
            puts x.join(" ")
        }
        oldCords.each do |cord|
            cord = getRandomCord()
            @hill[cord[0]][cord[1]] = " "
        end
        print("\r")
    end

    def getRandomCord() 
        r = Random.new
        return r.rand(0..@x - 1), r.rand(0..@y -1)
    end
end