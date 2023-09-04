require_relative 'app'
require_relative 'choose'

class Main
  def initialize
    @choose = Choose.new.choose
    @app = App.new
  end

  def start
    puts "Welcome to School Library App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
    loop do
      @app.send(@choose)
    end
  end
end

Main.new.start
