class Cat
  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.greet