module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

=begin
How do you find where Ruby will look for a method when that method is called? 
How can you find an object's ancestors?

use the .ancestors method to display a class's lookup path
Orange and HotSauce will both look in their own class, then the included module, then the basic 
lookup path past that (Object, Kernel, BasicObject)
=end

p Orange.ancestors
p HotSauce.ancestors