class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

=begin
Explain what the @@cats_count variable does and how it works. What code would you write to
test this theory?

The @@cats_count variable keeps track of the number of objects (cats) that have been 
initialized of the Cat class. This class varialbe is incrememted by 1 everytime the initialize
method is executed, which is ran when a new object of the cat class is created. To retrive the 
current value, call Cat.cats_count to retrieve the current value. If two objects (cats) are created,
then calling the method will return 2
=end

p Cat.cats_count
furry = Cat.new('cattish')
hairball = Cat.new('cattish')
p Cat.cats_count