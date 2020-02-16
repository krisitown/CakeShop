class Order
    attr_accessor :id, :status, :cart, :price

    def initialize
        @status = "new"
        @cart = []
    end

    def to_s
        "Status: #{@status}, Price: #{@price}"
    end
end