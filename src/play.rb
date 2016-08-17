class Play
  def initialize
  end

  def divider_yellow
    puts "----------------------------------------------------".yellow
  end

  def print_menu
  	puts "----------------------------------------------------".blue
  	puts "TOY ROBOT - by Niall O'Callaghan | github.com/noccer".yellow
    divider_yellow
  	puts "Choose an option: (case insensitive)".yellow
    puts "MAKE"
    puts "PLACE"
    puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
    puts "REPORT"
    divider_yellow
    puts "Bonus options:".yellow
    puts "DESTROY - destroy the robot"
    puts "TABLE - view Table Information"
    puts "GRID - update the Table to a grid size of your choice"
    puts "EXIT - close the program"
    divider_yellow
  	print "Your selection: ".yellow
  	gets.chomp.to_s.upcase
  end
end
