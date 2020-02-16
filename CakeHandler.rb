require_relative 'Cake'

class CakeHandler
    def initialize
        @cakes = []
    end
    
    def createCake(name, price, weight, description, timeToComplete)
        if !name || !price || !weight || !description || !timeToComplete
            puts "Cake cannot have nil arguments!"
        else
            cake = Cake.new
            cake.name = name
            cake.price = price
            cake.weight = weight
            cake.description = description
            cake.time_to_complete = timeToComplete
            
            puts cake.to_s
            @cakes << cake
        end
    end 

    def getCake(name)
        puts "Looking for cake with name '#{name}'"
        @cakes.find {|x| x.name == name }
    end
end