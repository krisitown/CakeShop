require_relative 'CakeHandler'
require_relative 'OrderHandler'

cakeHandler = CakeHandler.new
orderHandler = OrderHandler.new

line = gets.chomp
while (line != "quit")
    tokens = line.split(': ')
    command = tokens[0]
    tokens = tokens[1].split(', ') if tokens[1]
    case command
    when "createCake"
        cakeHandler.createCake(tokens[0], tokens[1], tokens[2], tokens[3], tokens[4])
    when "beginOrder"
        puts "Started order with id: " + orderHandler.beginOrder.to_s
    when "addToOrder"
        cake = cakeHandler.getCake(tokens[1])
        orderHandler.addToOrder(tokens[0].to_i, cake, tokens[2])
    when "payOrder"
        orderHandler.payOrder(tokens[0].to_i)
    when "finishOrder"
        orderHandler.finishOrder(tokens[0].to_i)
    when "balanceSheet"
        orderHandler.displayBalanceSheet
    when "viewOrder"
        orderHandler.viewOrder(tokens[0].to_i)
    when "help"
        #todo
    end

    line = gets.chomp
end