class Game
  def play
    "Start the game!"
  end
end

class Bingo
  def rules_of_play
    #rules of play
  end
end

=begin
What can we add to the Bingo class to allow it ot inherit the play method from the Game class?

add < Game after defining the class name Bingo. class Bingo < Game. Bingo is a version of a game,
so this inheritance makes sense.
=end