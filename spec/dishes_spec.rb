require 'dishes'

RSpec.describe Dishes do
  it "creates a dish" do
    dish = Dishes.new("Pizza", 9.99)
    expect(dish.show_name).to eq("Pizza")
    expect(dish.show_price).to eq(9.99)
  end

  it "fails if initialized with non-String name or non-Float price" do
    expect {dishes = Dishes.new(:pizza, 9.99)}.to raise_error "Dish name must be a String"
  end

  it "shows us the full dish" do
    dish = Dishes.new("Pizza", 9.99)
    expect(dish.show_full_dish).to eq("Pizza - £9.99")
  end
end