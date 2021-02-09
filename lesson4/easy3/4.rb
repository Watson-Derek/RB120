# class Cat
#   def initialize(type)
#     @type = type
#   end
# end

=begin
Given the above class, if we create a new instance of the class and then called to_s on that
instance we get something like #<Cat:0x007ff39b356d30>

How could we go about changing the to_s output on this method to look like this:
I am a tabby cat? (assuming 'tabby' is the type passed in during initialization)

define a to_s method that returns a string using the type in the sentence
=end

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{@type} cat"
  end
end

cat1 = Cat.new('tabby')
cat1.to_s