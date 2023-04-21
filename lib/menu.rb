#require 'dishes'
#require 'order'
#require 'dishes'
class Menu
  def initialize
    @menu = []
  end

  def add_menu(dish)
    fail "Dish should be a Dishes object" unless dish.is_a?(Dishes) 
    @menu << dish.show_full_dish
  end
    
  def show
    new_menu = @menu.join(', ').tr(",", "\n")
    return "#{new_menu}"
    # @menu.each do |dish|
    #   puts dish
    # end
  end
end

