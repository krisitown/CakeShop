require_relative 'Cake'
require_relative 'Order'

class OrderHandler
    def initialize
        @balanceSheet = []
        @orders = []
        @currentIndex = 0
    end

    def beginOrder
        order = Order.new
        order.id = @currentIndex
        @orders << order
        @currentIndex += 1
        order.id
    end

    def addToOrder(orderId, cake, quantity)
        if cake
            @orders[orderId].cart << {cake: cake, quantity: quantity}
            puts "Added #{cake.to_s} x #{quantity}, to order with id: #{orderId}"
        else
            puts "Cake cannot be nil!"
        end
    end

    def payOrder(orderId)
        order = @orders[orderId]
        if order.status === "paid"
            puts "Order is already paid."
        else
            order.status = "paid"
            puts "Order with id: #{orderId} paid. Time to complete: #{calculateTimeToComplete(order)} minutes."
            @balanceSheet << order
        end
    end

    def finishOrder(orderId)
        @orders[orderId].status = "done"
        puts "Order with id: #{orderId} finished."
    end

    def getOrder(orderId)
        @orders[orderId]
    end

    def viewOrder(orderId)
        order = @orders[orderId]
        puts "#{order.to_s} Time to complete: #{calculateTimeToComplete(order)} minutes."
        displayCart(order.cart)
    end

    def displayBalanceSheet
        finalAmount = 0
        @balanceSheet.each do |order|
            puts "Order #{order.id}:" 
            finalAmount += displayCart(order.cart)
            puts "========================="
        end
        puts "Final Amount: #{finalAmount}"
    end

    def calculateTimeToComplete(order)
        result = 0
        order.cart.each { |o| result += o[:cake].time_to_complete.to_f * o[:quantity].to_i }
        result
    end

    def displayCart(cart)
        amount = 0
        cart.each do |x| 
            amount += x[:cake].price.to_f * x[:quantity].to_i
            puts "#{x[:cake].name} x#{x[:quantity]} Amount: #{amount}"
        end
        amount
    end
end