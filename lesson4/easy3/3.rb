class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=begin
Given the above class, how do we create two different instances of this class with separate
names and ages?
=end

cat1 = AngryCat.new(12, 'meanie')
cat2 = AngryCat.new(17, 'oldie')