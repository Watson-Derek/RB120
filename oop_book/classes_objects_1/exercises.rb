class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speedup(mph)
    @speed += mph
  end

  def brake(mph)
    @speed -= mph
  end

  def shutoff
    @speed = 0
  end

  def show_speed
    @speed
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now the color #{color}"
  end

end

truck = MyCar.new(2020, 'Green', 'Ram 1500')
puts truck.color
puts truck.year

truck.spray_paint('olive')
