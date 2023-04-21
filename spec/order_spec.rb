require 'order'

RSpec.describe Order do
  context 'When Ordering' do
    it "can successfull add a dish to your order, also returns name & cost of item" do
      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(dish1)
      order = Order.new
      expect(order.add_to_order(dish1)).to eq ["Pizza - £9.99"]
    end

    it "adds a dish to an empty order and shows one dish in basket with Total price" do
      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(dish1)
      order = Order.new
      order.add_to_order(dish1)
      expect(order.show_basket).to eq "Pizza - £9.99\n Total: £9.99"
    end

    it "adds multiple items to your basket and recieve a Total price" do
      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      dish2 = double(:dishes, show_name: "Bread", show_price: 1.99, show_full_dish: "Bread - £1.99", is_a?: true)
      dish3 = double(:dishes, show_name: "Pasta", show_price: 2.99, show_full_dish: "Pasta - £2.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(dish1)
      menu.add_menu(dish2)
      menu.add_menu(dish3)
      order = Order.new
      order.add_to_order(dish1)
      order.add_to_order(dish2)
      order.add_to_order(dish3)
      expect(order.show_basket).to eq("Pizza - £9.99\n Bread - £1.99\n Pasta - £2.99\n Total: £14.97")
    end

    it 'fails if no dishes are added to order and show_basket is called' do
      order = Order.new
      expect { order.show_basket }.to raise_error "Your basket is empty"
    end
  end

  context 'When Checking Out' do
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

      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
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
      
      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
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

      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      dish2 = double(:dishes, show_name: "Bread", show_price: 1.99, show_full_dish: "Bread - £1.99", is_a?: true)
      dish3 = double(:dishes, show_name: "Pasta", show_price: 2.99, show_full_dish: "Pasta - £2.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
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
        
      dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(dish1)
      order = Order.new(io)
      order.add_to_order(dish1)
      order.checkout_order
    end
  end
end