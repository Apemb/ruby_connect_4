require 'pp'

class NoAvailableSlotError < StandardError
end

class ColumnNotExistingError < StandardError
end

class Grid

  NUMBER_OF_COLUMNS = 7
  NUMBER_OF_ROWS = 6

  def initialize
    @is_empty = true
    @slot_counters = Array.new(7, 0)
    @disk_colors = Array.new(7) { Array.new(6, '') }
  end

  def is_empty
    @is_empty
  end

  def fill column_index, color

    if column_index + 1 > NUMBER_OF_COLUMNS || column_index < 0
      raise ColumnNotExistingError.new
    end

    if @slot_counters[column_index] + 1 > NUMBER_OF_ROWS
      raise NoAvailableSlotError.new
    else

    @is_empty = false
    @slot_counters[column_index] += 1
    @disk_colors[column_index][@slot_counters[column_index] - 1] = color
    end
  end

  def disc_color_of_slot column_index, row_index
    if @slot_counters[column_index] > row_index
      @disk_colors[column_index][row_index]
    end
  end
end

