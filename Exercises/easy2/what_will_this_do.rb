class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

=begin
What will the above code output?

The first puts call is on the class method, which will output 'ByeBye'
The second puts call is on the object thing, which will output 'HelloHello'
=end