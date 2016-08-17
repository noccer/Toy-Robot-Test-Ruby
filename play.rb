require './robot.rb'
require './table.rb'
begin
  require 'colorize'
rescue LoadError
  puts "----------------------------------------------------"
  puts "TOY ROBOT - by Niall O'Callaghan | github.com/noccer"
  puts ""
  puts "IMPORTANT!"
  puts "To use this program, you need to install the Colorize gem."
  puts ""
  puts "More information about Colorize gem:"
  puts "https://github.com/fazibear/colorize"
  puts ""
  puts "Please run:"
  puts "gem install colorize"
  puts ""
  puts "If you wish to remove this gem afterwards, please run:"
  puts "gem uninstall colorize"
  puts "----------------------------------------------------"
  exit
end

@robot = nil
class Play
  def initialize
  end

  def divider_yellow
    puts "----------------------------------------------------".yellow
  end

  def print_menu
  	puts "----------------------------------------------------".blue
  	puts "TOY ROBOT - by Niall O'Callaghan | github.com/noccer".yellow
    divider_yellow
  	puts "Choose an option: (case insensitive)".yellow
    puts "MAKE"
    puts "PLACE"
    puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
    puts "REPORT"
    divider_yellow
    puts "Bonus options:".yellow
    puts "DESTROY - destroy the robot"
    puts "TABLE - view Table Information"
    puts "GRID - update the Table to a grid size of your choice"
    puts "EXIT - close the program"
    divider_yellow
  	print "Your selection: ".yellow
  	gets.chomp.to_s.upcase
  end
end

play = Play.new
table = nil

while true
  begin
  unless @table
    @table = Table.new(4,4)
    table = @table
  end
  selection = play.print_menu
	case selection
  when "MAKE"
    unless @robot
      @robot = Robot.new
      puts "We have built your robot!".green
      puts "Unique ID No. = #{@robot.__id__}".green
    else
      play.divider_yellow
      puts "You already have a robot!".red
      puts "Unique ID No. = #{@robot.__id__}".green
    end
  when "DESTROY"
    if @robot
      @robot = nil
      play.divider_yellow
      puts "Your robot has been destroyed... aww...".red
    else
      play.divider_yellow
      puts "You don't have a robot to destroy!".red
    end
  when "PLACE"
    if @robot
      play.divider_yellow
      robot = @robot
      table = @table
      @robot.place(robot, table)
    else
      play.divider_yellow
      puts "Your robot doesn't exist yet. Please run MAKE first!".red
    end
  when "PPP"
    if @robot.nil?
      @robot = Robot.new
    end
    table = @table
    @robot.place3n(table)
    puts "Your Robot details are as follows:"
    puts "Unique ID No. = #{@robot.__id__}".green
    if (@robot.x || @robot.y || @robot.f) != nil
      puts "Your robot is placed at (#{@robot.x},#{@robot.y}) and is facing #{@robot.f}".green
    end
  when "MOVE"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      robot = @robot
      @robot.move(robot, @table)
    elsif @robot && (@robot.x == nil)
      play.divider_yellow
      puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!".red
    else
      play.divider_yellow
      puts "Your robot doesn't exist yet. Please run MAKE first!".red
    end
  when "LEFT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      old_direction = @robot.f
      robot = @robot
      @robot.turn_left(robot)
      puts "Your robot was facing #{old_direction}, but is now facing #{@robot.f}.".green
    elsif @robot && (@robot.x == nil)
      play.divider_yellow
      puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!".red
    else
      puts "Your robot doesn't exist yet. Please run MAKE first!".red
    end
  when "RIGHT"
    if @robot && ((@robot.x || @robot.y || @robot.f) != nil)
      old_direction = @robot.f
      robot = @robot
      @robot.turn_right(robot)
      puts "Your robot was facing #{old_direction}, but is now facing #{@robot.f}.".green
    elsif @robot && (@robot.x == nil)
      play.divider_yellow
      puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!".red
    else
      puts "Your robot doesn't exist yet. Please run MAKE first!".red
    end
  when "REPORT"
    if @robot
      play.divider_yellow
      puts "Your Robot details are as follows:"
      puts "Unique ID No. = #{@robot.__id__}".green
      if ((@robot.x || @robot.y || @robot.f) == nil)
        puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!".green
      else
        puts "Your robot is placed at (#{@robot.x},#{@robot.y}) and is facing #{@robot.f}".green
      end
    else
      play.divider_yellow
      puts "Your robot doesn't exist yet. Please run MAKE first!".red
    end
  when "TABLE"
    if @table
      play.divider_yellow
      puts "The table is a #{@table.width + 1} x #{@table.height + 1} grid.".green
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-EAST corner]".green
    else
      play.divider_yellow
      puts "There is no Table yet!".red
    end
  when "GRID"
    if @table
      play.divider_yellow
      puts "The table is currently a #{@table.width + 1} x #{@table.height + 1} grid.".green
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-EAST corner]".green
      if @robot
        robot = @robot
        @robot.remove_from_table(robot)
      end
      grid_edit_mode_width  = true
      table.set_grid_logic(@table, grid_edit_mode_width, 'width')
      grid_edit_mode_height  = true
      table.set_grid_logic(@table, grid_edit_mode_height, 'height')
      play.divider_yellow
      puts "Your table now looks like this:"
      puts "#{@table.width + 1} x #{@table.height + 1} grid.".green
      puts "It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width},#{@table.height}) [NORTH-EAST corner]".green
    else
      play.divider_yellow
      puts "There is no Table, you need to make one!".red
    end
  when "EXIT"
    play.divider_yellow
  	puts "Thanks for playing TOY ROBOT - by Niall O'Callaghan | github.com/noccer".yellow.on_blue
    play.divider_yellow
    exit
	else
    puts "Sorry, that command is not recognised. Please try again.".red
	end # end of while loop

rescue SignalException => e
    puts e
    puts "----------------------------------------------------".red
    puts "     ERROR: Please type EXIT to quit the game.".red
    puts "----------------------------------------------------".red
    retry
end

end
