# CakeShop

The application can be run by running the following command in the directory where Main.rb is
ruby Main.rb

The program expects commands in the following form
{commandName}: {param1}, {param2}, ... {paramN}
Here is a list of all the possible commands and how they work:
createCake: {name}, {price}, {weight}, {description}, {timeToComplete (in minutes)} #creates a cake and adds it to the database
beginOrder #begins a new order, returning the id of the order in order to be manipulated in the future
addToOrder: {orderId}, {name of cake}, {quantity} #adds the cake identified by the name to the cart as many times as the quantity param
payOrder: {orderId} #changes the status of the order to paid and adds it to the balance sheet
finishOrder: {orderId} #changes the status of the order to finished
balanceSheet #displays the balance sheet after all paid orders
viewOrder: {orderId} #displays information about the order
help #describes all the commands
