require 'menu'
require 'dishes'

class Order
  def initialize(io = Kernel)
    @order = []
    @io = io
    @total = 0.0
  end
    
  def add_to_order(dish)  
    @order << dish.show_full_dish
    @total += dish.show_price
    return @order
  end

  def show_basket
    fail "Your basket is empty" if @order.empty?
    return @order.each do |item| 
      puts "#{item}"
      puts "Current total: #{@total}"
    end
  end
end