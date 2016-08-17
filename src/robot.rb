class Robot
  attr_accessor :initialize, :move, :place, :x, :y, :f

  # def initialize(x, y, f)
  def initialize
    # puts "robot initialized"
    @x = x
    @y = y
    @f = f
  end

  def place(robot, table)
    def pre_place_co_ords(robot, table, robot_x_or_y)
      # puts "starting pre-place for #{robot_x_or_y}"
      robot_co_ord = nil
      begin
        robot_co_ord = gets.chomp
        robot_co_ord == Integer(robot_co_ord) # error No1 - they enter non number
        raise if (robot_co_ord.to_i > table.width && robot_x_or_y == "x") # error No2 - enter number outside of table constraints.
        raise if (robot_co_ord.to_i > table.height && robot_x_or_y == "y") # error No3 - enter number outside of table constraints.
        raise if (robot_co_ord.to_i < 0) # error No4 - enter number outside of table constraints.
      rescue
        if # error No2 - No4
          (robot_co_ord.to_i > table.width && robot_x_or_y == "x") ||
          (robot_co_ord.to_i > table.height && robot_x_or_y == "y") ||
          (robot_co_ord.to_i < 0)
          puts "The table starts at co-ordinates (0,0) and runs to (#{table.width},#{table.height})".red
          puts "Please enter a valid number within these co-ordinates:".red
        else # error No1
          puts "Please enter a valid number only:".red
        end
        retry
      else
        if robot_x_or_y == "x"
          puts "----------------------------------------------------".yellow
          robot.x = robot_co_ord.to_i
        elsif robot_x_or_y == "y"
          robot.y = robot_co_ord.to_i
        end
      end
    end
    puts "Please enter robot x-cordinates (number):"
    pre_place_co_ords(robot, table, "x")
    puts "Please enter robot y-cordinates (number):"
    pre_place_co_ords(robot, table, "y")
    def pre_place_direction(robot)
      puts "Please enter robot direction facing ('NORTH' - 'SOUTH' - 'EAST' - 'WEST')"
      begin
        robot_f = gets.chomp.to_s.upcase
        raise if (%w(NORTH SOUTH EAST WEST).include? robot_f) == false
      rescue
        puts 'Please enter "NORTH" -or- "SOUTH" -or- "EAST" -or- "WEST" only:'.red
        retry
      else
        robot.f = robot_f
      end
    end
    pre_place_direction(robot)
    puts "Your robot is placed at (#{robot.x}, #{robot.y}) and is facing #{robot.f}".green
  end

  def place3n(table)
    if table.width < 3 || table.height < 3
      puts "Oops, this secret command won't work while the table is that small.".red
      puts "This command will usually place the robot at (3,3) facing NORTH.".red
      puts "Try making the table at least 4 x 4 wide then run PPP again.".red
    else
      @x = 3
      @y = 3
      @f = "NORTH"
    end
  end

  def remove_from_table(robot)
    robot.x = nil
    robot.y = nil
    robot.f = nil
    puts "Your robot is being lifted off the table while it's being resized.".red
    puts "Make sure to PLACE your robot again before you resume playing.".green
  end

  @x_modifier = 0
  @y_modifier = 0

  def check_direction
    case
      when (@f == "NORTH")
        @x_modifier = 0
        @y_modifier = 1
      when (@f == "EAST")
        @x_modifier = 1
        @y_modifier = 0
      when (@f == "SOUTH")
        @x_modifier = 0
        @y_modifier = -1
      when (@f == "WEST")
        @x_modifier = -1
        @y_modifier = 0
      else
        exit
      end
    end

  def move(robot, table)
    check_direction
    if (robot.x + @x_modifier <= table.width && robot.x + @x_modifier >= 0 && robot.y + @y_modifier <= table.height && robot.y + @y_modifier >= 0)
      robot.x = robot.x + @x_modifier
      robot.y = robot.y + @y_modifier
      puts "Your robot has moved #{robot.f} by 1 place.".green
      puts "Your robot is now at co-ordinates (#{robot.x},#{robot.y}).".green
    else
      puts "STOP! Your robot is at the edge of the table! Turn your robot LEFT or RIGHT to continue playing.".red
      puts "Your robot is at co-ordinates (#{robot.x},#{robot.y}) and facing #{robot.f}.".green
      puts "Run the TABLE command for more information about your table.".green
    end
  end

  def turn_error_messages(robot)
    puts "Error, your Robot is direction value is '#{robot.f}', not NORTH -or- SOUTH -or- EAST -or- WEST"
    puts "Please try again - run the PLACE command to enter a correct direction."
  end

  def turn_left(robot)
    case
      when (robot.f == "NORTH")
        robot.f = "WEST"
      when (robot.f == "EAST")
        robot.f = "NORTH"
      when (robot.f == "SOUTH")
        robot.f = "EAST"
      when (robot.f == "WEST")
        robot.f = "SOUTH"
      else
        turn_error_messages(robot)
      end
  end

  def turn_right(robot)
    case
      when (robot.f == "NORTH")
        robot.f = "EAST"
      when (robot.f == "EAST")
        robot.f = "SOUTH"
      when (robot.f == "SOUTH")
        robot.f = "WEST"
      when (robot.f == "WEST")
        robot.f = "NORTH"
      else
        turn_error_messages(robot)
      end
  end
end
