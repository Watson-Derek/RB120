class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin
Given the above class, which is  a class method and how do you know?
How do you call a class method?

The self.manufacturer is a class method. When self is used in the method definition, that denotes
a class method (def self.some_name)

To call a class method, call it on the class name itself
Television.manufacturer

=end