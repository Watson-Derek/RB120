class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin
In the make_one_year_older method we have used self. What is antoher way we could write this method
so we don't have to use the self prefix?

since there is an accessor method, the self can just be removed and replaced with @
=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end