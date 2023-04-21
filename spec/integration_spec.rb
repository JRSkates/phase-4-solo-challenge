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
      expect(menu.show).to eq "Pizza - £9.99"
    end

    it "Creates multiple dishes and add them to the menu" do
      dish1 = Dishes.new("Pizza", 9.99)
      dish2 = Dishes.new("Bread", 1.99)
      dish3 = Dishes.new("Pasta", 2.99)
      menu = Menu.new
      menu.add_menu(dish1)
      menu.add_menu(dish2)
      menu.add_menu(dish3)
      expect(menu.show).to eq "Pizza - £9.99\n Bread - £1.99\n Pasta - £2.99"
    end
  end

  context "Ordering dishes" do
    it 'adds 1 item to your basket and recieve a Total price' do
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      order = Order.new
      order.add_to_order(dish1)
      expect(order.show_basket).to eq "Pizza - £9.99\n Total: £9.99"
    end

    it "adds multiple items to your basket and recieve a Total price" do
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
      expect(order.show_basket).to eq "Pizza - £9.99\n Bread - £1.99\n Pasta - £2.99\n Total: £14.97"
    end
  end

  context "Checking Out" do
    it 'fails if basket is empty' do
      order = Order.new
      expect { order.checkout_order }.to raise_error "Your basket is empty"
    end
  
    it "lets you exit checkout is user enters N" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Pizza - £9.99\n Total: £9.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel hit N")
      expect(io).to receive(:gets).and_return("N")
      expect(io).to receive(:puts).with("Cancelling checkout")
  
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      order = Order.new(io)
      order.add_to_order(dish1)
      order.checkout_order
    end
  
    it "lets you checkout an order with one item when user confirms" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Pizza - £9.99\n Total: £9.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel hit N")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Order confirmed! Your food is on the way!")
        
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      order = Order.new(io)
      order.add_to_order(dish1)
      order.checkout_order
    end
  
    it "lets you checkout an order with mutiple item when user confirms" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Pizza - £9.99\n Bread - £1.99\n Pasta - £2.99\n Total: £14.97")
      expect(io).to receive(:puts).with("To order enter Y, to cancel hit N")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Order confirmed! Your food is on the way!")
  
      dish1 = Dishes.new("Pizza", 9.99)
      dish2 = Dishes.new("Bread", 1.99)
      dish3 = Dishes.new("Pasta", 2.99)
      menu = Menu.new
      menu.add_menu(dish1)
      menu.add_menu(dish2)
      menu.add_menu(dish3)
      order = Order.new(io)
      order.add_to_order(dish1)
      order.add_to_order(dish2)
      order.add_to_order(dish3)
      order.checkout_order
    end
  
    it "cancels the checkout if the confirmation input is not valid" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Pizza - £9.99\n Total: £9.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel hit N")
      expect(io).to receive(:gets).and_return("test")
      expect(io).to receive(:puts).with("Not a valid input, please restart checkout")
          
      dish1 = Dishes.new("Pizza", 9.99)
      menu = Menu.new
      menu.add_menu(dish1)
      order = Order.new(io)
      order.add_to_order(dish1)
      order.checkout_order
    end
  end
end