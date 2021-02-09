class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# How could you change the method name so that the method name is more clear and less repetitive?

# could change from light_status to just status, or something like current_status, since chances
# are that an object of class Light probably has light in the name