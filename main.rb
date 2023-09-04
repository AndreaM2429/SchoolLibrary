require_relative 'app'

class Main
  def initialize
    @app = App.new
    @menu = {
      '1' => 'list_all_books', '2' => 'list_all_people',
      '3' => 'create_a_person', '4' => 'create_a_book',
      '5' => 'create_a_rental', '6' => 'list_all_rentals_for_person',
      '7' => 'end_app'
    }.freeze
  end

  def menu
    puts "\nPlease choose an option by enter a number"
    @menu.each { |key, element| puts "#{key} - #{element.capitalize.gsub '_', ' '}" }
    print "\nYour option: "
    action = @menu[gets.chomp]
    if action
      action
    else
      puts "\n(͠°◡͡°) Invalid option select a valid one\n\n"
      choose
    end
  end

  def start
    puts "Welcome to School Library App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
    loop do
      @app.send(menu)
    end
  end
end

Main.new.start
