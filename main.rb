require_relative 'app'
require_relative 'choose'

# def main
#   app = App.new
#   puts "Welcome to School Library App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
#   loop do
#     app.send(choose)
#   end
# end

# main

class Main
  def initialize
    @choose = Choose.new
    @app = App.new
  end

end
