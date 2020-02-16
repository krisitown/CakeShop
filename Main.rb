require_relative 'CakeHandler'
require_relative 'OrderHandler'

cakeHandler = CakeHandler.new
orderHandler = OrderHandler.new

line = gets.chomp
while (line != "quit")
    tokens = line.split(', ')
    case tokens[0]
    when "createCake"
        cakeHandler.createCake(tokens[1], tokens[2], tokens[3], tokens[4])
    when "beginOrder"
        puts "Started order with id: " + orderHandler.beginOrder.to_s
    when "addToOrder"
        cake = cakeHandler.getCake(tokens[2])
        orderHandler.addToOrder(tokens[1].to_i, cake, tokens[3])
    when "payOrder"
        orderHandler.payOrder(tokens[1].to_i)
    when "finishOrder"
        orderHandler.finishOrder(tokens[1].to_i)
    when "balanceSheet"
        orderHandler.displayBalanceSheet
    when "help"
        #todo
    end

    line = gets.chomp
end