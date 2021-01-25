class Person
  #attr_accessor :name

  def name=(n)
    @first_name = n.split.first
    @last_name = n.split.last
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name