class Cake
    attr_accessor :name, :description, :weight, :price

    def to_s
        "#{name}, #{weight}g $#{price} - #{description}"
    end
end