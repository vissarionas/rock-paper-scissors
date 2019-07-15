# frozen_string_literal: true

SCENARIOS = {
  'rock' => {
    'scissors' => "Rock breaks scissor\nYou won!!",
    'paper' => "Paper covers rock\nYou Lost :(",
    'rock' => "Rock against rock\nIt's a tie"
  },
  'paper' => {
    'rock' => "Paper covers rock\nYou won!!",
    'scissors' => "Scissors cut paper\nYou lost :(",
    'paper' => "Paper against paper\nIt's a tie"
  },
  'scissors' => {
    'paper' => "Scissors cut paper\nYou won!!",
    'rock' => "Rock breaks scissor\nYou lost :(",
    'scissors' => "Scissors against scissors\nIt's a tie"
  }
}.freeze

system 'clear'
puts 'Welcome to RockPaperScissors'

def selected_tool(user_selection)
  case user_selection
  when 'R'
    'rock'
  when 'P'
    'paper'
  when 'S'
    'scissors'
  end
end

def get_user_choice
  loop do
    print 'Choose one: (R/P/S): '
    user_selection = gets.chomp.upcase
    selected_tool = selected_tool(user_selection)
    return selected_tool if SCENARIOS.key? selected_tool
  end
end

def play_again?
  print 'Would you like to play again? (Y/N) '
  replay = gets.chomp.upcase
  replay == 'Y'
end


loop do
  user_selection = get_user_choice

  computer_selection = SCENARIOS.keys.sample
  puts "Your choice #{user_selection} "\
    "computer choice #{computer_selection}"

  # puts SCENARIOS[user_selection][computer_selection.to_sym]

  break unless play_again?
end
