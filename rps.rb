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

def play_again?
  print "\nWould you like to play again? (Y/N) "
  replay = gets.chomp.upcase
  replay == 'Y'
end

def print_result(user_tool, computer_tool)
  puts "\nYou chose #{user_tool} "\
    "and computer chose #{computer_tool}"
  puts SCENARIOS[user_tool][computer_tool]
end

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

def user_choice
  loop do
    print 'Choose one: (R: rock /P: paper /S: sciccors): '
    user_choice = gets.chomp.upcase
    selected_tool = selected_tool(user_choice)
    return selected_tool if SCENARIOS.key? selected_tool
  end
end

def computer_choice
  SCENARIOS.keys.sample
end

def prepare_platform
  system 'clear'
  puts 'Rock-Paper-Scissors'
end

loop do
  prepare_platform
  user_tool = user_choice
  computer_tool = computer_choice
  print_result(user_tool, computer_tool)
  break unless play_again?
end
