=begin
when running the following code, there is an error. 
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

what is the error and how do we fix it?
=end

# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

=begin
The error is because :name only has a reader method, and on the last line of the
code, we are trying to set the name, but that method is not defined either through
attr or a seperate method

=end

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
puts bob.name
bob.name = "Bob"
puts bob.name