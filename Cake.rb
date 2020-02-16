class Cake
    attr_accessor :name, :description, :weight, :price, :time_to_complete

    def to_s
        "#{name}, #{weight}g $#{price}, time to complete #{time_to_complete} minutes. - #{description}"
    end
end