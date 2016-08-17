class Table
  attr_accessor :initialize, :width, :height

  def initialize(width,height)
    @width = width
    @height = height
  end

  @grid_edit_mode_width  = true
  @grid_edit_mode_height = true

  def update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
    if width_or_height_string == 'width'
      table.width = new_table_width_or_height_value
    elsif width_or_height_string == 'height'
      table.height = new_table_width_or_height_value
    end
  end

  def set_grid_logic(table, grid_edit_mode, width_or_height_string)
    while grid_edit_mode == true
      puts "Please enter your new desired table #{width_or_height_string}:"
      new_table_width_or_height_value = ((gets.chomp.to_s.to_i) -1)
      if new_table_width_or_height_value > 0
        update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
        grid_edit_mode = false
      else
        while new_table_width_or_height_value < 1
          puts "Please enter a #{width_or_height_string} value greater than 1:"
          new_table_width_or_height_value = ((gets.chomp.to_s.to_i) -1)
          if new_table_width_or_height_value > 0
            update_grid_value(table, width_or_height_string, new_table_width_or_height_value)
            grid_edit_mode = false
          end
        end
      end
    end
  end

end
