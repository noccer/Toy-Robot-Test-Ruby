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
    @table = Table.new(5,5)
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
      puts "you already have a robot! here it is:"
      puts @robot.inspect
    end
  when "DESTROY"
    if @robot
      @robot = nil
      puts "***************************************************"
      puts "Robot destroyed... aww..."
    else
      puts "***************************************************"
      puts "You don't have a robot to destroy!"
    end
  when "PLACE"
    if @robot
      puts "***************************************************"
      puts "please enter robot x-cordinates (number)"
      robot_x = gets.chomp.to_i
      puts "please enter robot y-cordinates (number)"
      robot_y = gets.chomp.to_i
      puts "please enter robot direction facing ('NORTH' - 'SOUTH' - 'EAST' - 'WEST')"
      robot_f = gets.chomp.to_s
      @robot.place(robot_x, robot_y, robot_f)
      puts "Robot placed at #{robot_x}, #{robot_y}, and it is facing #{robot_f}"
      puts @robot.inspect
    else
      puts "***************************************************"
      puts "Robot doesn't exist, please create a robot first!"
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
      puts "Robot isn't on the table yet, please place your Robot on the table first!"
    else
      puts "***************************************************"
      puts "Robot doesn't exist, please create a robot first!"
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
      puts "Your Table details are as follows:"
      puts @table.inspect
    else
      puts "***************************************************"
      puts "There is no Table yet!"
    end
  when "GRID"
    if @table
      puts "***************************************************"
      puts "Your Table is " + @table.width.to_s + " units wide, " + @table.height.to_s + " units high."

      @grid_edit_mode_width  = true
      play.set_grid_logic(@table, @grid_edit_mode_width, 'width')

      @grid_edit_mode_height  = true
      play.set_grid_logic(@table, @grid_edit_mode_height, 'height')

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
