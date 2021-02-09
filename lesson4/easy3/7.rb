class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

=begin
What is used in this class but doesn't add any value?

the class method self.information doesn't add any value. It is a class method, and doesn't look
to either instance variables of an object of its class for the string it returns. It will always
return the same string.

The return call is also not needed, as a method always returns the last line of the method
unless otherwise specified
=end