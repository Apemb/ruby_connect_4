require 'rspec'
require_relative('../../app/grid')

describe Grid do

  describe 'initialize' do
    it 'is empty' do
      #Arrange
      #Act
      grid = Grid.new

      #Assert
      expect(grid.is_empty).to be_truthy
    end
  end

  describe 'fill' do
    context 'grid is empty' do
      it 'is not empty after first fill' do
        #Arrange
        grid = Grid.new

        #Act
        grid.fill 3

        #Assert
        expect(grid.is_empty).to be_falsey
      end
    end

    context 'grid has already had one fill move' do
      it 'is not empty after second fill move' do
        #Arrange
        grid = Grid.new
        grid.fill 3

        #Act
        grid.fill 3

        #Assert
        expect(grid.is_empty).to be_falsey
      end
    end

    context 'grid has a point in column, and adds a new point in that column' do
      it 'has a not empty slot in second position of column' do
        #Arrange
        grid = Grid.new
        grid.fill 3

        #Act
        grid.fill 3

        #Assert
        expect(grid.get_slot(3, 1).is_empty).to be_falsey
      end
    end

    context 'grid has no point in column, and add a new point in that column' do

      let(:grid) { Grid.new }

      before do
        #Arrange

        #Act
        grid.fill 3
      end

      #Assert
      it 'has an empty slot in second position of that column' do
        expect(grid.get_slot(3, 1).is_empty).to be_truthy
      end

      it 'has an filled slot in first position of that column' do
        expect(grid.get_slot(3, 0).is_empty).to be_falsey
      end

      it 'has an empty slot in first position of other column' do
        expect(grid.get_slot(2, 0).is_empty).to be_truthy
      end
    end

    context 'grid has 6 points in one column' do

      let(:grid) { Grid.new }

      before do
        #Arrange
        6.times { grid.fill 3 }

        #Act
      end

      #Assert
      it 'throws an NoAvailableSlot error when addind a 7th point in that column' do
        expect { grid.fill 3}.to raise_error(NoAvailableSlotError)
      end
    end

    context 'grid is empty' do

      let(:grid) { Grid.new }

      #Assert
      it 'throws an ColumnNotExistingError error when addind a point in 8th column' do
        expect { grid.fill 7}.to raise_error(ColumnNotExistingError)
      end

      it 'throws an ColumnNotExistingError error when addind a point -1th column' do
        expect { grid.fill -1}.to raise_error(ColumnNotExistingError)
      end
    end
  end
end