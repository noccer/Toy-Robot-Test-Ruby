require './robot.rb'
require './table.rb'

def create_table
  table = Table.new(5,5)
  @table = table
end
create_table

def create_robot(x)
  robot = Robot.new(x)
  puts "ran create_robot, robot created"
  puts robot.inspect
  @robot = robot
end

def destroy_robot
  @robot = nil
  puts "***************************************************"
  puts "Robot destroyed... aww..."
end

def set_grid_value(grid_modifier_x, x)
  if x == 'w'
    @table.w = @new_table_width
    @grid_modifier_w = false
  elsif x == 'h'
    @table.h = @new_table_height
    @grid_modifier_h = false
  end
end

def print_menu
	puts "***************************************************"
	puts "NIALL'S TOY ROBOT"
	puts "Choose an option:"
  puts "MAKE"
  puts "DESTROY"
	puts "PLACE"
	# puts "MOVE"
  puts "REPORT"
  puts "***************************************************"
  puts "TABLE INFORMATION"
  puts "Choose an option:"
  puts "TABLE"
  puts "GRID"
  puts "***************************************************"
	print "Selection: "
	gets.chomp.to_s.upcase
end

while true
	selection = print_menu
	case selection
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
		@robot.move
  when "REPORT"
    if @robot
      puts "***************************************************"
      puts "Your Robot details are as follows:"
      puts @robot.inspect
    else
      puts "***************************************************"
      puts "There is no Robot yet, why not make one!?"
    end
  when "TABLE"
    if @table
      puts "***************************************************"
      puts "Your Table details are as follows:"
      puts @table.inspect
    else
      puts "***************************************************"
      puts "There is no Table yet!"
    end
  when "GRID"
    if @table
      puts "***************************************************"
      puts "Your Table is " + @table.w.to_s + " units wide, " + @table.h.to_s + " units high."
      @grid_modifier_w = true
      while @grid_modifier_w == true
        puts "Please enter your new desired table width:"
        @new_table_width = gets.chomp.to_s.to_i
        if @new_table_width > 0
          set_grid_value(@grid_modifier_w, 'w')
        else
          while @new_table_width < 1
            puts "Please enter a number greater than 0:"
            @new_table_width = gets.chomp.to_s.to_i
            if @new_table_width > 0
              set_grid_value(@grid_modifier_w, 'w')
            end
          end
        end
      end
      @grid_modifier_h = true
      while @grid_modifier_h == true
        puts "Please enter your new desired table height:"
        @new_table_height = gets.chomp.to_s.to_i
        if @new_table_height > 0
          set_grid_value(@grid_modifier_h, 'h')
        else
          while @new_table_height < 1
            puts "Please enter a number greater than 0:"
            @new_table_height = gets.chomp.to_s.to_i
            if @new_table_height > 0
              set_grid_value(@grid_modifier_h, 'h')
            end
          end
        end
      end
      puts "***************************************************"
      puts "Your table now looks like this:"
      puts @table.inspect
    else
      puts "***************************************************"
      puts "There is no Table, you need to make one!"
    end
	else
    puts "exiting"
		exit
	end
end

puts robot.inspect
