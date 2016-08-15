class Robot
  attr_accessor :initialize, :move, :place, :x, :y, :f

  # def initialize(x, y, f)
  def initialize
    # puts "robot initialized"
    @x = x
    @y = y
    @f = f
  end

  def place(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def place3n
    @x = 3
    @y = 3
    @f = "NORTH"
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
      puts "Your robot has moved #{robot.f} by 1 place"
      puts "Your robot is now at co-ordinates #{robot.x},#{robot.y} and is facing #{robot.f}"
    else
      puts "STOP! Your robot is at the edge of the table! Turn your robot LEFT or RIGHT to continue playing."
      puts "Your robot is at co-ordinates (#{robot.x},#{robot.y}) and is facing #{robot.f}"
      puts "Run the TABLE command for more information about your table."
    end
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
        puts "Error, your Robot is direction value is '#{robot.f}', not NORTH -or- SOUTH -or- EAST -or- WEST"
        puts "Please try again - run the PLACE command to correct this."
      end
  end
end
