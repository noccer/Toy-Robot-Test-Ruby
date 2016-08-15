require './robot.rb'
require './table.rb'
require 'colorize'

@robot = nil
class Play
  def initialize
  end

  @grid_edit_mode_width  = true
  @grid_edit_mode_height = true

  # def update_grid_value(x, new_table_width_or_height_value, table)
  def update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
    if width_or_height_string == 'width'
      table.width = new_table_width_or_height_value
    elsif width_or_height_string == 'height'
      table.height = new_table_width_or_height_value
    end
  end

  def set_grid_logic(table, grid_edit_mode, width_or_height_string)
    while grid_edit_mode == true
      puts "Please enter your new desired table #{width_or_height_string}:"
      new_table_width_or_height_value = gets.chomp.to_s.to_i
      if new_table_width_or_height_value > 0
        update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
        grid_edit_mode = false
      else
        while new_table_width_or_height_value < 1
          puts "Please enter a #{width_or_height_string} value greater than 0:"
          new_table_width_or_height_value = gets.chomp.to_s.to_i
          if new_table_width_or_height_value > 0
            update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
            grid_edit_mode = false
          end
        end
      end
    end
  end

  def print_menu
  	puts "----------------------------------------------------".yellow.blue
  	puts "TOY ROBOT - by Niall O'Callaghan | github.com/noccer".yellow
    # puts "----------------------------------------------------".yellow
  	puts "Choose an option:".yellow
    puts "MAKE"
    puts "PLACE"
    puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
    puts "REPORT"
    puts "----------------------------------------------------".yellow
    puts "Bonus options:".yellow
    puts "DESTROY - destroy the robot"
    puts "TABLE - view Table Information"
    puts "GRID - update the Table to a grid size of your choice"
    puts "EXIT - close the program"
    puts "----------------------------------------------------".yellow
  	print "Your selection: ".yellow
  	gets.chomp.to_s.upcase
  end
end

play = Play.new

while true
  unless @table
    @table = Table.new(4,4)
  end
  selection = play.print_menu
	case selection
  when "MAKE"
    unless @robot
      @robot = Robot.new
      puts "Here is your Robot:"
      puts @robot.inspect
    else
      puts "----------------------------------------------------".yellow
      puts "You already have a robot! here it is:"
      puts @robot.inspect
    end
  when "DESTROY"
    if @robot
      @robot = nil
      puts "----------------------------------------------------".yellow
      puts "Your robot has been destroyed... aww..."
    else
      puts "----------------------------------------------------".yellow
      puts "You don't have a robot to destroy!"
    end
  when "PLACE"
    if @robot
      puts "----------------------------------------------------".yellow
      puts "Please enter robot x-cordinates (number)"
      robot_x = gets.chomp.to_i
      puts "Please enter robot y-cordinates (number)"
      robot_y = gets.chomp.to_i
      puts "Please enter robot direction facing ('NORTH' - 'SOUTH' - 'EAST' - 'WEST')"
      robot_f = gets.chomp.to_s
      @robot.place(robot_x, robot_y, robot_f)
      puts "Your robot is placed at #{robot_x}, #{robot_y}, and it is facing #{robot_f}"
      puts @robot.inspect
    else
      puts "----------------------------------------------------".yellow
      puts "Your robot doesn't exist, please create a robot first!"
    end
  when "PPP"
    @robot = Robot.new
    @robot.place3n
    puts @robot.inspect
  when "MOVE"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      robot = @robot
      @robot.move(robot, @table)
    elsif @robot && (@robot.x == nil)
      puts "----------------------------------------------------".yellow
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "----------------------------------------------------".yellow
      puts "Your robot doesn't exist, please create a robot first!"
    end
  when "LEFT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      old_direction = @robot.f
      robot = @robot
      @robot.turn_left(robot)
      puts "Your robot was facing #{old_direction}, but is now facing #{@robot.f}."
    elsif @robot && (@robot.x == nil)
      puts "----------------------------------------------------".yellow
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "There is no Robot yet, why not make one!?"
    end
  when "RIGHT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      old_direction = @robot.f
      robot = @robot
      @robot.turn_right(robot)
      puts "Your robot was facing #{old_direction}, but is now facing #{@robot.f}."
    elsif @robot && (@robot.x == nil)
      puts "----------------------------------------------------".yellow
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "There is no Robot yet, why not make one!?"
    end
  when "REPORT"
    if @robot
      puts "----------------------------------------------------".yellow
      puts "Your Robot details are as follows:"
      puts @robot.inspect
    else
      puts "----------------------------------------------------".yellow
      puts "There is no Robot yet, why not make one!?"
    end
  when "TABLE"
    if @table
      puts "----------------------------------------------------".yellow
      puts "The table is a #{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"
    else
      puts "----------------------------------------------------".yellow
      puts "There is no Table yet!"
    end
  when "GRID"
    if @table
      puts "----------------------------------------------------".yellow
      puts "The table is currently a #{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"

      @grid_edit_mode_width  = true
      play.set_grid_logic(@table, @grid_edit_mode_width, 'width')

      @grid_edit_mode_height  = true
      play.set_grid_logic(@table, @grid_edit_mode_height, 'height')

      puts "----------------------------------------------------".yellow
      puts "Your table now looks like this:"
      puts "#{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"
    else
      puts "----------------------------------------------------".yellow
      puts "There is no Table, you need to make one!"
    end
  when "EXIT"
    exit
	else
    puts "Sorry, that command is not recognised. Please try again."
	end
end
