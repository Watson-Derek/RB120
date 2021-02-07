class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
Which of these two classes have an instance variable and how do you know?

The Pizza class has an instance variable 'name'. We can see this from the initialize method,
@name is an instance variable being assigned to the value passed in when creating a new object
of the Pizza class. The @ designates an instance variable for the class.
=end