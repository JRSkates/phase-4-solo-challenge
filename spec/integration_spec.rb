require 'order'
require 'menu'
require 'dishes'

RSpec.describe "Integration" do
  context "Creating and adding to a Menu" do
    it "should fail to add a dish if its not a Dishes object" do
      menu = Menu.new
      fake_dish = "test"
      expect { menu.add_menu(fake_dish) }.to raise_error "Dish should be a Dishes object"
    end
  
    it "Creates a new dish and add it too the menu and show with price" do
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      expect(menu.show).to eq(["Pizza - £9.99"])
    end

    it "Creates multiple dishes and add them to the menu" do
      dish1 = Dishes.new("Pizza", 9.99)
      dish2 = Dishes.new("Bread", 1.99)
      dish3 = Dishes.new("Pasta", 2.99)
      menu = Menu.new
      menu.add_menu(dish1)
      menu.add_menu(dish2)
      menu.add_menu(dish3)
      expect(menu.show).to eq(["Pizza - £9.99", "Bread - £1.99", "Pasta - £2.99"])
    end
  end

  context "Ordering dishes" do
    it 'adds 1 item to your basket' do
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      order = Order.new
      order.add_to_order(dish1)
      expect(order.show_basket).to eq ["Pizza - £9.99"]
    end

    it "adds multiple items to your basket" do
      dish1 = Dishes.new("Pizza", 9.99)
      dish2 = Dishes.new("Bread", 1.99)
      dish3 = Dishes.new("Pasta", 2.99)
      menu = Menu.new
      menu.add_menu(dish1)
      menu.add_menu(dish2)
      menu.add_menu(dish3)
      order = Order.new
      order.add_to_order(dish1)
      order.add_to_order(dish2)
      order.add_to_order(dish3)
      expect(order.show_basket).to eq(["Pizza - £9.99", "Bread - £1.99", "Pasta - £2.99"])
    end
  end
end