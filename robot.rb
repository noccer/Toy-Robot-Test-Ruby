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
    if (robot.x < table.width && robot.x > 1 && robot.y < table.height && robot.y > 1)
      robot.x = robot.x + @x_modifier
      robot.y = robot.y + @y_modifier
      puts "Your robot has moved #{robot.f} by 1 place"
      puts "Your robot is now at co-ordinates #{robot.x},#{robot.y} and is facing #{robot.f}"
    else
      puts "STOP! Your robot is at the edge of the table! Turn your robot LEFT or RIGHT to continue playing."
      puts "Your robot is at co-ordinates (#{robot.x},#{robot.y}) and is facing #{robot.f}"
      puts "The table is #{table.width} units wide (EAST-WEST), and #{table.height} units high (NORTH-SOUTH)"
    end
  end
end
