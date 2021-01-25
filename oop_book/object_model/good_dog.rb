module Greeting
  def greeting sound
    puts sound
  end
end

class WatsonDogs
  include Greeting
end

chewie = WatsonDogs.new
chewie.greeting('Chewie says Bouff!')