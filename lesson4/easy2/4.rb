class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

=begin
What could you add to this class to simplify it and remove two methods from the class definition
while maintaining the same functionality?

add an attr_accessor :type to the beginning of the class, removing both 'type' methods

=end

class BeesWax
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end