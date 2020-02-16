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
            puts "Order with id: #{orderId} paid."
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

    def displayBalanceSheet
        finalAmount = 0
        @balanceSheet.each do |order|
            amount = 0
            order.cart.each { |x| amount += x[:cake].price.to_f * x[:quantity].to_i }
            finalAmount += amount
            puts "#{order.cart.inspect} Amount: #{amount}"
        end
        puts "Final Amount: #{finalAmount}"
    end
end