require './robot.rb'
require './table.rb'

# def create_robot(x,y,f)
#   robot = Robot.new(x,y,f)
def create_robot(x)
  robot = Robot.new(x)
  "ran create_robot, robot created"
  puts robot.inspect
  @robot = robot
end

def print_menu
	puts "*****************"
	puts "NIALL'S TOY ROBOT"
	puts "Choose an option"
  puts "MAKE"
	puts "PLACE"
	puts "MOVE"
  puts "REPORT"
	print "Selection: "
	gets.chomp.to_s.upcase
end

while true
	selection = print_menu
	case selection
	when "PLACE"
    puts "please enter robot x-cordinates (number)"
    robot_x = gets.chomp
    if @robot
      puts "Robot exists, placing robot"
      @robot.place(robot_x)
      puts "Robot created at #{robot_x}"
    else
      puts "Robot exists, creating robot"
      create_robot(robot_x)
      @robot.place(robot_x)
      puts "Robot created at #{robot_x}"
    end
	when "MOVE"
    create_robot
		@robot.move
  when "REPORT"
    if @robot
      puts @robot.inspect
    else
      puts "There is no Robot yet, why not make one!?"
    end
	else
    puts "exiting"
		exit
	end
end

puts robot.inspect
