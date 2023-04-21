require 'order'

RSpec.describe Order do
  it "adds 1 dish to your order" do
    dish1 = double(:dishes, show_name: "Pizza", show_price: 9.99, show_full_dish: "Pizza - £9.99", is_a?: true)
    menu = double(:menu, menu: [], add_menu: true)
    menu.add_menu(dish1)
    order = Order.new
    expect(order.add_to_order(dish1)).to eq ["Pizza - £9.99"]
  end

  it "adds multiple items to your basket" do
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
    expect(order.show_basket).to eq(["Pizza - £9.99", "Bread - £1.99", "Pasta - £2.99"])
  end
end