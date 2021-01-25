class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name='')
    @first_name = first_name
    @last_name = last_name
  end

  def name
    (self.first_name + ' ' + self.last_name).strip
  end

  def name=(fullname)
    self.first_name = fullname.split[0]
    if fullname.split.size > 1
      self.last_name = fullname.split[1]
    else
      self.last_name = ''
    end
  end

end

# Given the below usage of the Person class, code the class definition

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'