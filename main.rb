require_relative 'app'

def main
  app = App.new
  puts "Welcome to School Library App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
  loop do
    app.send(choose)
  end
end

main
