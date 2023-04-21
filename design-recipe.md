# Solo Challenge - Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

```

_Class Structure Design:_

```ruby

@DEFAULT_MENU = {
  pasta: 8.99,
  pizza: 9.99,
  garlic_bread: 4.99
}

class Order #our main class
  def initialize(io = Kernel)
    @order = {}
    @view_menu = Menu.new
    @io = io
  end

  def show_menu
    return @view_menu.show
  end

  def show_basket
    fail "Your basket is empty" if @order.empty?
    return @order.each do |food, price| 
      puts "#{food}: £#{price}"
    end
  end

  def search_menu(search)
    return @view_menu.search_for_dish(search)
  end

  def add_to_order(:dish)  
    @order[:dish] = @view_menu[:dish]
    return @order
  end

  def order_food
    @io.puts "Here is your final order: "
    @io.puts "#{@order.show_basket}"
    @io.puts "
  end
end

class Menu
  def initialize(@menu)
    @menu = {
      pasta: 8.99,
      pizza: 9.99,
      garlic_bread: 4.99
    }
  end

  def show
    @menu.each do |food, price| 
      puts "#{food}: £#{price}"
    end
  end

  def search_for_dish(dish)
    @menu.select { |food| return food if dish == food}
  end
end

class Dishes
  def initialize(dish, price)
    @dish = dish
    @price = price
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# 1 - Show menu
order = Order.new
order.show_menu # => pasta: £8.99, pizza: £9.99, garlic_bread: £4.99

# 2 - Show order list 
order = Order.new
order.add_to_order(:pasta)
order.show_basket # => "pasta: £8.99 - Total: £8.99"

# 3 - Search menu by dish
order = Order.new
order.search_menu(pasta) # => "pasta: £8.99"
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# 1 - Show empty order list
order = Order.new
order.show_basket # => fail "Your basket is empty"

# 2 - Show order list 
order = Order.new
order.add_to_order(:pasta)
order.show_basket # => "pasta: £8.99 - Total: £8.99"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
