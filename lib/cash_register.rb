require 'pry'
class CashRegister 
    attr_accessor :total, :discount, :cart, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end
     

    def add_item(title, price, quantity = 1) 
        quantity.times do 
            @cart << title
        end 
        # binding.pry 
        price_list = []
        price_list << (price * quantity)

        @total = (price_list.reduce(@total) {|sum, item_cost| sum + item_cost})
        # binding.pry 
        self.last_transaction = price * quantity 
        # binding.pry  
    end

    def apply_discount
        if @discount != 0
        @total = (self.total - self.total * @discount.to_f/100).to_i
        return "After the discount, the total comes to $#{@total}."
        else 
        return "There is no discount to apply."
        end
        # binding.pry 
    end

    def items 
        self.cart
        # binding.pry 
    end

    def void_last_transaction 
        @total = @total - self.last_transaction        
    end

end

# binding.pry 
