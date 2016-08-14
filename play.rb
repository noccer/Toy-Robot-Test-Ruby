require './robot.rb'
require './table.rb'

class Play
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def create_table
    table = Table.new(5,5)
    @table = table
  end

  def create_robot(x)
    robot = Robot.new(x)
    @robot = robot
    puts "***************************************************"
    puts "ran create_robot, robot successfully created"
    puts "Here is your robot:"
    puts @robot.inspect
  end

  def destroy_robot
    @robot = nil
    puts "***************************************************"
    puts "Robot destroyed... aww..."
  end

  @grid_modifier_w = true
  @grid_modifier_h = true

  def set_grid_value(x)
    if x == 'w'
      @table.w = @new_table_width
      @grid_modifier_w = false
      puts "@grid_modifier_w is now:"
      puts @grid_modifier_w
    elsif x == 'h'
      @table.h = @new_table_height
      @grid_modifier_h = false
      puts "@grid_modifier_h is now:"
      puts @grid_modifier_h
    end
    puts "outisde set_grid_value if statement:"
    puts @grid_modifier_w
  end

  def set_grid_logic(grid_modifier, width_or_height_string, new_table_width_or_height_value, method)
    # puts "outside while loop: grid_modifier is:"
    # puts grid_modifier
    while grid_modifier == true
      # puts "start of while loop: grid_modifier is:"
      # puts grid_modifier
      puts "Please enter your new desired table #{width_or_height_string}:"
      new_table_width_or_height_value = gets.chomp.to_s.to_i
      if new_table_width_or_height_value > 0
        set_grid_value(method)
        # puts "grid_modifier in first if statement is:"
        # puts grid_modifier
      else
        while new_table_width_or_height_value < 1
          puts "Please enter a number greater than 0:"
          new_table_width_or_height_value = gets.chomp.to_s.to_i
          if new_table_width_or_height_value > 0
            set_grid_value(method)
            # puts "grid_modifier in else-while-if statement is:"
            # puts grid_modifier
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
end

play = Play.new(@table, @robot)
@table = Table.new(5,5)

  while true
    selection = play.print_menu
  	case selection
    when "MAKE"
      if @robot.nil?
        play.create_robot(nil)
      else
        puts "***************************************************"
        puts "you already have a robot! here it is:"
        puts @robot.inspect
      end
    when "DESTROY"
      if @robot
        play.destroy_robot
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
        play.set_grid_logic(@grid_modifier_w, 'width', @new_table_width, 'w')

        @grid_modifier_h = true
        play.set_grid_logic(@grid_modifier_h, 'height', @new_table_height, 'h')

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
