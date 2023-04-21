
require 'menu'

class Dishes
  def initialize(dish_name, dish_price)
    fail "Dish name must be a String" unless dish_name.is_a?(String)
    @dish_name = dish_name
    @dish_price = dish_price
  end

  def show_name
    @dish_name
  end

  def show_price
    @dish_price
  end

  def show_full_dish
    return "#{@dish_name} - £#{@dish_price}"
  end
end

=begin
dish = Dishes.new("Ford Prefect", 9.99)
p dish.show_name
p dish.show_price
p dish.show_full_dish
=end