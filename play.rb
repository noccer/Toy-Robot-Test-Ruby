require './robot.rb'
require './table.rb'

def create_robot
  robot = Robot.new #initialise a blank robot which is not placed on the board yet
  @robot = robot
end

def print_menu
	puts "*****************"
	puts "NIALL'S TOY ROBOT"
	puts "Choose an option"
	puts "PLACE"
	puts "MOVE"
	print "Selection: "
	gets.chomp.to_s.upcase
end
