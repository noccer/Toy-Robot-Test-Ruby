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


end
