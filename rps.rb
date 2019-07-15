# frozen_string_literal: true

SCENARIOS = {
  R: {
    S: "Rock breaks scissor\nYou won!!",
    P: "Paper covers rock\nYou Lost :(",
    R: "Rock against rock\nIt's a tie",
    tool: 'rock'
  },
  P: {
    R: "Paper covers rock\nYou won!!",
    S: "Scissors cut paper\nYou lost :(",
    P: "Paper against paper\nIt's a tie",
    tool: 'paper'
  },
  S: {
    P: "Scissors cut paper\nYou won!!",
    R: "Rock breaks scissor\nYou lost :(",
    S: "Scissors against scissors\nIt's a tie",
    tool: 'scissor'
  }
}.freeze

system 'clear'
puts 'Welcome to RockPaperScissors'

def get_user_choice_as_sym
  loop do
    print 'Choose one: (R/P/S): '
    choice = gets.chomp.upcase
    return choice.to_sym if SCENARIOS.keys.include? choice.to_sym
  end
end

def play_again?
  print 'Would you like to play again? (Y/N) '
  replay = gets.chomp.upcase
  replay == 'Y'
end


loop do
  user_selection = get_user_choice_as_sym

  computer_selection = SCENARIOS.keys[Random.new.rand 3]

  puts "Your choice #{SCENARIOS[user_selection][:tool]} "\
    "computer choice #{SCENARIOS[computer_selection.to_sym][:tool]}"

  puts SCENARIOS[user_selection][computer_selection.to_sym]

  break unless play_again?
end
