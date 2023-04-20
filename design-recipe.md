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

## 2. Design the Class System

_The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

```

_Class Structure Design:_

```ruby
class Order #our main class
  def initialize()
    @order = {}
  end

  def show_menu
    menu = Menu.new
    return menu.show
  end

  def show_basket
    fail "Your basket is empty" if @order.empty?
    return @order
  end

  def add_to_order(dish)

  end

  def order_food

  end
end

class Menu
  def initialize
    @menu = {food: price}
  end

  def show
    @menu.each do |food, price| 
      puts "#{food}: £#{price}"
    end
  end

  def search_for_dish(dish)

  end
end

class Dishes
  def initialize(dish, price)
    @dish = dish
    @price = price
  end

  def add_to_menu

  end

  def remove_from_menu

  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
