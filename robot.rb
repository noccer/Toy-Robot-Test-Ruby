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

end
