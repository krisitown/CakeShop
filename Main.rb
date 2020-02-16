require_relative 'CakeHandler'
require_relative 'OrderHandler'

cakeHandler = CakeHandler.new
orderHandler = OrderHandler.new

def printHelp
    puts "The program expects commands in the following form"
    puts "{commandName}: {param1}, {param2}, ... {paramN}"
    puts "Here is a list of all the possible commands and how they work:"
    puts "createCake: {name}, {price}, {weight}, {description}, {timeToComplete (in minutes)} #creates a cake and adds it to the database"
    puts "beginOrder #begins a new order, returning the id of the order in order to be manipulated in the future"
    puts "addToOrder: {orderId}, {name of cake}, {quantity} #adds the cake identified by the name to the cart as many times as the quantity param"
    puts "payOrder: {orderId} #changes the status of the order to paid and adds it to the balance sheet"
    puts "finishOrder: {orderId} #changes the status of the order to finished"
    puts "balanceSheet #displays the balance sheet after all paid orders"
    puts "viewOrder: {orderId} #displays information about the order"
    puts "help #describes all the commands"
end

puts "Please enter a command: "
line = gets.chomp

while (line != "quit")
    puts "Please enter a command: "
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
        printHelp
    end

    line = gets.chomp
end