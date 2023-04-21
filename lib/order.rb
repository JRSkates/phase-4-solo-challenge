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
    basket = @order.join(', ').tr(",", "\n")
    return "#{basket}\n Total: £#{@total.round(2)}"
    # @order.each do |item| 
    #   puts"#{item}"
    # end
    # puts "Current total: #{@total.round(2)}"
  end

  def checkout_order
    fail "Your basket is empty" if @order.empty?
    basket = @order.join(', ').tr(",", "\n")
    @io.puts "Here is your final order: "
    @io.puts "#{basket}\n Total: £#{@total.round(2)}"
    @io.puts "To order enter Y, to cancel hit N"
    confirmation = @io.gets.chomp.upcase
    confirmation == "N"
    if confirmation == "N"
      @io.puts "Cancelling checkout"
    elsif confirmation == "Y"
      @io.puts "Order confirmed! Your food is on the way!"
    else
      @io.puts "Not a valid input, please restart checkout"
    end
  end
end