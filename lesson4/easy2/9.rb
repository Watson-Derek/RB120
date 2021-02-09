class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
What would happen if we added a play method ot the Bingo class, noting that there is already a
method of this name in the Game class which Bingo inherits from?

The play method within the Bingo class would be executed instead of the play method in the Game
class when the method is called on an object of the Bingo class.
=end