require './robot.rb'
require './table.rb'

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
  	puts "***************************************************"
  	puts "NIALL'S TOY ROBOT"
  	puts "Choose an option:"
    puts "MAKE"
    puts "DESTROY"
  	puts "PLACE"
  	puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
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
      puts "***************************************************"
      puts "You already have a robot! here it is:"
      puts @robot.inspect
    end
  when "DESTROY"
    if @robot
      @robot = nil
      puts "***************************************************"
      puts "Your robot has been destroyed... aww..."
    else
      puts "***************************************************"
      puts "You don't have a robot to destroy!"
    end
  when "PLACE"
    if @robot
      puts "***************************************************"
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
      puts "***************************************************"
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
      puts "***************************************************"
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "***************************************************"
      puts "Your robot doesn't exist, please create a robot first!"
    end
  when "LEFT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      puts "Turning Left"
    elsif @robot && (@robot.x == nil)
      puts "***************************************************"
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "There is no Robot yet, why not make one!?"
    end
  when "RIGHT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      puts "Turning Right"
    elsif @robot && (@robot.x == nil)
      puts "***************************************************"
      puts "Your robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "There is no Robot yet, why not make one!?"
    end
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
      puts "The table is a #{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"
    else
      puts "***************************************************"
      puts "There is no Table yet!"
    end
  when "GRID"
    if @table
      puts "***************************************************"
      puts "The table is currently a #{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"

      @grid_edit_mode_width  = true
      play.set_grid_logic(@table, @grid_edit_mode_width, 'width')

      @grid_edit_mode_height  = true
      play.set_grid_logic(@table, @grid_edit_mode_height, 'height')

      puts "***************************************************"
      puts "Your table now looks like this:"
      puts "#{@table.width + 1} x #{@table.height + 1} grid."
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-SOUTH]"
    else
      puts "***************************************************"
      puts "There is no Table, you need to make one!"
    end
	else
    puts "exiting"
		exit
	end
end
