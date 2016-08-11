require './robot.rb'
require './table.rb'

def create_robot(x)
  robot = Robot.new(x)
  "ran create_robot, robot created"
  puts robot.inspect
  @robot = robot
end

def destroy_robot
  @robot = nil
  puts "***************************************************"
  puts "Robot destroyed... aww..."
end

def print_menu
	puts "***************************************************"
	puts "NIALL'S TOY ROBOT"
	puts "Choose an option:"
  puts "MAKE"
  puts "DESTROY"
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
    if @robot
      puts "***************************************************"
      puts "please enter robot x-cordinates (number)"
      robot_x = gets.chomp
      puts "Robot exists, placing robot"
      @robot.place(robot_x)
      puts "Robot placed at #{robot_x}"
    else
      puts "***************************************************"
      puts "Robot doesn't exist, please create a robot first!"
    end
	when "MOVE"
    create_robot
		@robot.move
  when "REPORT"
    if @robot
      puts @robot.inspect
    else
      puts "***************************************************"
      puts "There is no Robot yet, why not make one!?"
    end
  when "MAKE"
    if @robot.nil?
      create_robot(nil)
      puts "***************************************************"
      puts "Robot successfully made"
      puts "Here is your new Robot:"
      puts @robot.inspect
    else
      puts "***************************************************"
      puts "you already have a robot! here it is:"
      puts @robot.inspect
    end
  when "DESTROY"
    if @robot
      destroy_robot
    else
      puts "***************************************************"
      puts "You don't have a robot to destroy!"
    end
	else
    puts "exiting"
		exit
	end
end

puts robot.inspect
