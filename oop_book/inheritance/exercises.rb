module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :model, :year

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speedup(mph)
    @current_speed += mph
  end

  def brake(mph)
    @current_speed -= mph
  end

  def shutoff
    @current_speed = 0
  end

  def show_speed
    @current_speed
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now the color #{color}"
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon"
  end

  def age
    "This #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{self.year} #{self.color} #{self.model}"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{self.year} #{self.color} #{self.model}"
  end
end

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors


laramie = MyTruck.new(2020, 'green', 'Ram 1500')
laramie.speedup(10)
puts laramie.show_speed
laramie.speedup(35)
puts laramie.show_speed
laramie.speedup(30)
puts laramie.show_speed
laramie.brake(45)
puts laramie.show_speed
laramie.shutoff
puts laramie.show_speed
MyTruck.mileage(22, 475)
puts laramie
puts laramie.age