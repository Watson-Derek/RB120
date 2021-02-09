class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin
What is the difference in the way these two methods/classes work?

In the first, the show_template method calls the getter method for template
In the second, self is called, but this is unnecessary since there is a getter method anyway

=end