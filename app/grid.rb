require_relative('../app/slot')

class NoAvailableSlotError < StandardError
end

class ColumnNotExistingError < StandardError
end

class Grid
  def initialize
    @is_empty = true
    @slot_counter = 0
  end

  def is_empty
    @is_empty
  end

  def fill column_index
    @slot_counter = @slot_counter + 1
    if @slot_counter > 6
      raise NoAvailableSlotError.new
    elsif column_index > 6 || column_index < -0
      raise ColumnNotExistingError.new
    else
      @is_empty = false
    end
  end

  def get_slot column_index, row_index
    slot = Slot.new
    if column_index == 3 && (@slot_counter == 2 || row_index == 0)
      slot.fill
    end
    slot
  end
end

