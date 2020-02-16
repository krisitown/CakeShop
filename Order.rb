class Order
    attr_accessor :id, :status, :cart, :price

    def initialize
        @status = "new"
        @cart = []
    end
end