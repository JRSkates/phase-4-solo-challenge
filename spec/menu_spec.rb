require 'menu'

RSpec.describe Menu do
  it "Creates a new dish and add it too the menu and show with price" do
    dish1 = double(:dishes, show_full_dish: "Pizza - £9.99", is_a?: true)
    menu = Menu.new
    menu.add_menu(dish1)
    expect(menu.show).to eq(["Pizza - £9.99"])
  end

  it "should fail if its not a Dishes object" do
    menu = Menu.new
    expect { menu.add_menu("test") }.to raise_error "Dish should be a Dishes object"
  end

  it "Creates multiple dishes and add them to the menu" do
    dish1 = double(:dishes, show_full_dish: "Pizza - £9.99", is_a?: true)
    dish2 = double(:dishes, show_full_dish: "Bread - £1.99", is_a?: true)
    dish3 = double(:dishes, show_full_dish: "Pasta - £2.99", is_a?: true)
    menu = Menu.new
    menu.add_menu(dish1)
    menu.add_menu(dish2)
    menu.add_menu(dish3)
    expect(menu.show).to eq(["Pizza - £9.99", "Bread - £1.99", "Pasta - £2.99"])
  end
end