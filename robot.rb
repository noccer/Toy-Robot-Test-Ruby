class Robot
  attr_accessor :initialize, :move, :place, :x, :y, :f

  # def initialize(x, y, f)
  def initialize
    # puts "robot initialized"
    @x = x
    @y = y
    @f = f
  end

  # def location
  # end
  #
  # def direction
  # end

  def place(x)
    puts "def place has been run, placed at #{x}"
    @x = x
  end

  def move
    puts "Robot Moved"
  end

  # def left
  # end
  #
  # def right
  # end
  #
  # def report
  # end
  #
  # def remove
  # end

end
