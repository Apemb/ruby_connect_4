
class NoAvailableSlotError < StandardError
end

class ColumnNotExistingError < StandardError
end

class Grid

  NUMBER_OF_COLUMN = 7

  def initialize
    @is_empty = true
    @slot_counters = Array.new(7, 0)
  end

  def is_empty
    @is_empty
  end

  def fill column_index
    if column_index + 1 > NUMBER_OF_COLUMN || column_index < 0
      raise ColumnNotExistingError.new
    end

    @slot_counters[column_index] += 1
    if @slot_counters[column_index] + 1 > NUMBER_OF_COLUMN
      raise NoAvailableSlotError.new
    else
      @is_empty = false
    end
  end

  def get_disc_color column_index, row_index

    if @slot_counters[column_index] > row_index
      true
    end
  end
end

