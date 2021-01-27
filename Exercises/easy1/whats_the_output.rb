class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
What does the code above print?

It outputs:
Fluffy
My name is FLUFFY (from the to_s method)
FLUFFY
FLUFFY

this happens b/c the first time the to_s method is called in the class, the 
destructive method upcase! is called on the @name instance variable. This variable
points to the same string object that the local variable name points to outside
the class, so it is changed as well

To fix the code so only the instance variable has the upcase! method called, use
clone on the original assignment in the intitialize method.
=end

# Changed code:
# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.dup
#   end

#   def to_s
#     @name.upcase!
#     "My name is #{@name}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

