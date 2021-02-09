module Tires
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include Tires

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    # 4 tires are various tire pressures
    @tires = tire_array
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Motorcycle < Vehicle
  include Tires

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    # 2 tires are various tire pressures
    @tires = tire_array
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end