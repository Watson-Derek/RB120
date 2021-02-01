require 'pry'

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

  # def move_output
  #   @value
  # end
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
  attr_accessor :moves, :name, :score

  def initialize
    set_name
    @moves = []
  end

  def move_choices(choice)
    return Rock.new(choice) if choice == 'rock'
    return Paper.new(choice) if choice == 'paper'
    return Scissors.new(choice) if choice == 'scissors'
    return Lizard.new(choice) if choice == 'lizard'
    return Spock.new(choice) if choice == 'spock'
  end

  def move
    moves.last
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

  def choice_convert(str)
    return 'rock' if str == 'r'
    return 'paper' if str == 'p'
    return 'scissors' if str == 'sc'
    return 'lizard' if str == 'l'
    return 'spock' if str == 'sp'
    str
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUES[0..-2].join(', ')}, " \
      "or #{Move::VALUES[-1]}:"
      choice = choice_convert(gets.chomp.downcase)
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    moves << move_choices(choice)
  end
end

class Computer < Player
  attr_reader :weights, :description

  def choose
    moves << move_choices(computer_choose(weighted(Move::VALUES, weights)))
  end

  def computer_choose(array)
    r = rand(0.0..1.0)
    choice = nil
    array.select do |move, rate|
      break if choice
      choice = move if rate > r
    end
    choice
  end

  def weighted(moves, weights)
    cumulative = 0.0

    moves.each_with_index.map do |move, index|
      if weights[index] == 0.0
        [move, 0.0]
      else
        [move, cumulative += weights[index]]
      end
    end
  end
end

class R2d2 < Computer
  def initialize
    super
    @weights = [1.0, 0, 0, 0, 0]
    @description = "is a big fan of rocks"
  end

  def set_name
    self.name = 'R2D2'
  end
end

class Hal < Computer
  def initialize
    super
    @weights = [0.05, 0.0, 0.75, 0.1, 0.1]
    @description = "really likes to cut things"
  end

  def set_name
    self.name = 'Hal'
  end
end

class Chappie < Computer
  def initialize
    super
    @weights = [0.2, 0.2, 0.2, 0.2, 0.2]
    @description = "doesn't really have any favorite stuff"
  end

  def set_name
    self.name = 'Chappie'
  end
end

class Sonny < Computer
  def initialize
    super
    @weights = [0.05, 0.05, 0.05, 0.85, 0]
    @description = "loves lizards but doesn't like people from other planets"
  end

  def set_name
    self.name = 'Sonny'
  end
end

class Number5 < Computer
  def initialize
    super
    @weights = [0.05, 0.45, 0.025, 0.025, 0.45]
    @description = "really likes to read and likes people that are logical"
  end

  def set_name
    self.name = 'Number 5'
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    clear_screen
    @human = Human.new
    @computer = [R2d2, Hal, Chappie, Sonny, Number5].sample.new
    @@rounds = nil
  end

  def clear_screen
    system("clear")
  end

  def yes_no?
    loop do
      answer = gets.chomp.downcase
      return true if answer == 'y' || answer == 'yes'
      return false if answer == 'n' || answer == 'no'
      puts "Invalid response, please enter 'y' or 'n':"
    end
  end

  def display_rules
    puts "\n" \
         "Rock beats Scissors and Lizard.\n" \
         "Paper beats Rock and Spock.\n" \
         "Scissors beats Paper and Lizard.\n" \
         "Lizard beats Paper and Spock.\n" \
         "Spock beats Rock and Scissors.\n" \
         "\n" \
         "Press enter to continue."
    gets.chomp
  end

  def display_welcome_message_1
    clear_screen
    puts "Hi, #{human.name}! \n" \
         "Welcome to #{Move::VALUES.join(', ')}! \n" \
         "Would you like to see the rules? Enter 'y' or 'n':"
    display_rules if yes_no?
  end

  def display_welcome_message_2
    clear_screen
    puts "You're playing against #{computer.name}. \n" \
         "#{computer.name} #{computer.description}. \n" \
         "\n" \
         "First to #{@@rounds} wins is the winner!\n" \
         "\n"
  end

  def set_total_rounds
    puts "How many rounds will it take to win? Enter a number to play to:"
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if answer.is_a?(Integer)
      puts "Not a valid input, please enter an integer:"
    end

    answer
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}!\n" \
         "Would you like to see the final move list? (y/n)"

    if yes_no?
      puts "#{human.name} moves: #{human.moves.map(&:to_s)}"
      puts "#{computer.name} moves: #{computer.moves.map(&:to_s)}"
    end

    puts "Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}\n" \
         "#{computer.name} chose #{computer.move}."
    puts
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
    puts
  end

  def display_running_scores
    puts "Current Scores:\n" \
         "#{human.name}: #{human.score}\n" \
         "#{computer.name}: #{computer.score}"
    puts
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
      break if human.score == @@rounds || computer.score == @@rounds
      display_running_scores
    end
  end

  def main_loop
    loop do
      display_welcome_message_2
      main_game
      clear_screen
      display_moves
      display_grand_winner
      break unless play_again?
    end
  end

  def play
    display_welcome_message_1
    @@rounds = set_total_rounds
    main_loop
    display_goodbye_message
  end
end

RPSGame.new.play
