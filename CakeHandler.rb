require_relative 'Cake'

class CakeHandler
    def initialize
        @cakes = []
    end
    
    def createCake(name, price, weight, description)
        if !name || !price || !weight || !description
            puts "Cake cannot have nil arguments!"
        else
            cake = Cake.new
            cake.name = name
            cake.price = price
            cake.weight = weight
            cake.description = description
            
            puts cake.to_s
            @cakes << cake
        end
    end 

    def getCake(name)
        @cakes.find {|x| x.name == name }
    end
end