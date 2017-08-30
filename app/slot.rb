class Slot
  attr_reader :is_empty

  def initialize
    @is_empty = true
  end

  def fill
    @is_empty = false
  end
end
