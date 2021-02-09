class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin
Given the above class, what happens if the methods are called as below?

- tv will be initialized as a new object of the Television class
- tv.manufacturer will return an undefined method error, as the manufacturer method is a class method
- model will return nothing (no logic in the method, but will execute)

- the last two lines will return the opposite of above, as manufacturer is a class method, and 
model is an instance method


=end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model