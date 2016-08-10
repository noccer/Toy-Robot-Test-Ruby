require './robot.rb'
require './table.rb'

def create_robot
  robot = Robot.new #initialise a blank robot which is not placed on the board yet
  @robot = robot
end
