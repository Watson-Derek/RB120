class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  VALUE_OPTIONS = ['(r)ock', '(p)aper', '(sc)issors', '(l)izard', '(sp)ock']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def >(other_move)
    self.class.defeats.include?(other_move.class)
  end
end

class Rock < Move
  def self.defeats
    [Scissors, Lizard]
  end
end

class Paper < Move
  def self.defeats
    [Rock, Spock]
  end
end

class Scissors < Move
  def self.defeats
    [Paper, Lizard]
  end
end

class Lizard < Move
  def self.defeats
    [Paper, Spock]
  end
end

class Spock < Move
  def self.defeats
    [Scissors, Rock]
  end
end

class Player
  attr_accessor :moves, :name, :score

  def initialize
    set_name
    @moves = []
  end

  def move
    moves.last
  end

  private

  def move_choices(choice)
    return Rock.new(choice) if choice == 'rock'
    return Paper.new(choice) if choice == 'paper'
    return Scissors.new(choice) if choice == 'scissors'
    return Lizard.new(choice) if choice == 'lizard'
    return Spock.new(choice) if choice == 'spock'
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUE_OPTIONS[0..-2].join(', ')}, " \
      "or #{Move::VALUE_OPTIONS[-1]}:"
      choice = choice_convert(gets.chomp.downcase)
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    moves << move_choices(choice)
  end

  private

  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
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
end

class Computer < Player
  attr_reader :weights, :description

  def choose
    moves << move_choices(computer_choose(weighted(Move::VALUES, weights)))
  end

  private

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

  private

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

  private

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

  private

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

  private

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

  private

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

  def play
    display_welcome_message_1
    @@rounds = set_total_rounds
    main_loop
    display_goodbye_message
  end

  private

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

  def clear_screen
    system("clear")
  end

  def yes_no?
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'yes', 'n', 'no'].include?(answer)
      puts "Invalid response, please enter y/yes or n/no."
    end
    answer.start_with?('y')
  end

  def display_rules
    puts ""

    [Rock, Paper, Scissors, Lizard, Spock].each do |move|
      puts "#{move} beats #{move.defeats.join(' and ')}."
    end

    puts "\n" \
         "Press enter to contine."
    gets.chomp
  end

  def display_welcome_message_1
    clear_screen
    puts "Hi, #{human.name}! \n" \
         "Welcome to #{Move::VALUES.join(', ')}! \n" \
         "\n" \
         "Would you like to see the rules? Enter 'y' or 'n':"
    display_rules if yes_no?
  end

  def set_total_rounds
    puts "How many rounds will it take to win?\n" \
         "Enter a number to play to between 1 and 10:"
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if answer >= 1 && answer <= 10
      puts "Not a valid input, please enter an integer between 1 and 10:"
    end

    answer
  end

  def display_welcome_message_2
    clear_screen
    puts "You're playing against #{computer.name}. \n" \
         "#{computer.name} #{computer.description}. \n" \
         "\n" \
         "First to #{@@rounds} wins is the winner!\n" \
         "\n"
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def display_goodbye_message
    puts "Would you like to see the final move list? (y/n)"

    if yes_no?
      puts "\n" \
           "#{human.name} moves: #{human.moves.map(&:to_s)}\n" \
           "#{computer.name} moves: #{computer.moves.map(&:to_s)}"
    end

    puts "\nThanks for playing #{Move::VALUES.join(', ')}! Good bye!"
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

  def display_human_win
    puts "Congratulations #{human.name}! You have beaten #{computer.name}!\n" \
         "\n" \
         "Final Score:\n" \
         "\n" \
         "#{human.name}: #{human.score}\n" \
         "#{computer.name}: #{computer.score}\n" \
         "\n"
  end

  def display_computer_win
    puts "Sorry! #{computer.name} has won!\n" \
         "\n" \
         "Final Score:\n" \
         "\n" \
         "#{computer.name}: #{computer.score}\n" \
         "#{human.name}: #{human.score}\n" \
         "\n"
  end

  def display_grand_winner
    if human.score > computer.score
      display_human_win
    else
      display_computer_win
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    yes_no?
  end
end

RPSGame.new.play
