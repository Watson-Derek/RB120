class Transform
  def initialize(n)
    @n = n
  end

  def uppercase
    @n.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')