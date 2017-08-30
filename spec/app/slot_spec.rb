require 'rspec'
require_relative('../../app/slot')

describe Slot do

  describe 'initialize' do
    it 'is empty' do
      #Arrange
      #Act
      slot = Slot.new

      #Assert
      expect(slot.is_empty).to be_truthy
    end
  end

  describe 'fill' do
    context 'when slot is empty' do
      it 'is not empty after fill move' do
        #Arrange
        slot = Slot.new

        #Act
        slot.fill

        #Assert
        expect(slot.is_empty).to be_falsey
      end
    end
  end
end