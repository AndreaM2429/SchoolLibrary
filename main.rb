require_relative 'app'

MENU = {
  '1' => 'list_all_books', '2' => 'list_all_people',
  '3' => 'create_a_person', '4' => 'create_a_book',
  '5' => 'create_a_rental', '6' => 'list_all_rentals_for_person',
  '7' => 'end_app'
}.freeze

def choose
  puts "\nPlease choose an option by enter a number"
  MENU.each { |key, element| puts "#{key} - #{element.capitalize.gsub '_', ' '}" }
  print "\nYour option: "
  action = MENU[gets.chomp]
  if action
    action
  else
    puts "\n(͠°◡͡°) Invalid option select a valid one\n\n"
    choose
  end
end

def main
  app = App.new
  puts "Welcome to School Library App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
  loop do
    app.send(choose)
  end
end

main
