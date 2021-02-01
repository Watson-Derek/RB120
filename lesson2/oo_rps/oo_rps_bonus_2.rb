class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    @value
  end
end

class Rock < Move
  def >(other_move)
    rock? && (other_move.scissors? || other_move.lizard?)
  end

  def <(other_move)
    rock? && (other_move.paper? || other_move.spock?)
  end
end

class Paper < Move
  def >(other_move)
    paper? && (other_move.rock? || other_move.spock?)
  end

  def <(other_move)
    paper? && (other_move.scissors? || other_move.lizard?)
  end
end

class Scissors < Move
  def >(other_move)
    scissors? && (other_move.paper? || other_move.lizard?)
  end

  def <(other_move)
    scissors? && (other_move.rock? || other_move.spock?)
  end
end

class Lizard < Move
  def >(other_move)
    lizard? && (other_move.spock? || other_move.paper?)
  end

  def <(other_move)
    lizard? && (other_move.rock? || other_move.scissors?)
  end
end

class Spock < Move
  def >(other_move)
    spock? && (other_move.rock? || other_move.scissors?)
  end

  def <(other_move)
    spock? && (other_move.lizard? || other_move.paper?)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
  end

  def move_choices(choice)
    return Rock.new(choice) if choice == 'rock'
    return Paper.new(choice) if choice == 'paper'
    return Scissors.new(choice) if choice == 'scissors'
    return Lizard.new(choice) if choice == 'lizard'
    return Spock.new(choice) if choice == 'spock'
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUES[0..-2].join(', ')}, " \
      "or #{Move::VALUES[-1]}."
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = move_choices(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = move_choices(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  ROUNDS = 3

  def initialize
    clear_screen
    @human = Human.new
    @computer = Computer.new
  end

  def clear_screen
    system("clear")
  end

  def display_welcome_message
    clear_screen
    puts "Hi, #{human.name}!"
    puts "Welcome to #{Move::VALUES.join(', ')}!"
    puts "First to #{ROUNDS} wins is the winner!"
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner
    return human if human.move > computer.move
    return computer if computer.move > human.move
    false
  end

  def display_winner
    winner = determine_winner
    if winner
      puts "#{winner.name} won this round!"
      winner.score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_running_scores
    puts "Current Scores:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def human_win
    puts "Congratulations #{human.name}! You have beaten #{computer.name}!"
    puts "Final Score:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def computer_win
    puts "Sorry! #{computer.name} has won!"
    puts "Final Score:"
    puts "#{computer.name}: #{computer.score}"
    puts "#{human.name}: #{human.score}"
  end

  def display_grand_winner
    if human.score > computer.score
      human_win
    else
      computer_win
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def main_game
    reset_scores
    loop do
      human.choose
      computer.choose
      clear_screen
      display_moves
      display_winner
      break if human.score == ROUNDS || computer.score == ROUNDS
      display_running_scores
    end
  end

  def play
    loop do
      clear_screen
      display_welcome_message
      main_game
      clear_screen
      display_moves
      display_grand_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
