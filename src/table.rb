class Table
  attr_accessor :initialize, :width, :height

  def initialize(width,height)
    @width = width
    @height = height
  end

  def apply_grid_value(table, width_or_height_string, new_table_width_or_height_value)
    if width_or_height_string == 'width'
      table.width = new_table_width_or_height_value
    elsif width_or_height_string == 'height'
      table.height = new_table_width_or_height_value
    end
  end

  def set_grid_value(table, width_or_height_string)
    if width_or_height_string == "height"
      puts "----------------------------------------------------".yellow
    end
    puts "Please enter new table #{width_or_height_string} (units):"
    begin
      new_table_width_or_height_value = gets.chomp
      new_table_width_or_height_value == Integer(new_table_width_or_height_value)
      raise if (new_table_width_or_height_value.to_i < 2)
    rescue
        puts "Please enter a numeric value greater than 1:".red
      retry
    else
      new_table_width_or_height_value = new_table_width_or_height_value.to_i
      apply_grid_value(table, width_or_height_string, (new_table_width_or_height_value - 1))
    end
  end

end
