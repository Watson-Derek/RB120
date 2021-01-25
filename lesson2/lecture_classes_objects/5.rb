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

  def to_s
    name
  end

end


bob = Person.new('Robert Smith')
puts "The person's name is: #{bob}"