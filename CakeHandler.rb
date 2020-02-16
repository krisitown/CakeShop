require_relative 'Cake'

class CakeHandler
    def initialize
        @cakes = []
    end
    
    def createCake(name, price, weight, description)
        cake = Cake.new
        cake.name = name
        cake.price = price
        cake.weight = weight
        cake.description = description

        puts cake.to_s
        @cakes << cake
    end 

    def getCake(name)
        @cakes.find {|x| x.name == name }
    end
end