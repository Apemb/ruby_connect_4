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
        grid.fill 3, 'yellow'

        #Assert
        expect(grid.is_empty).to be_falsey
      end
    end

    context 'grid has already had one fill move' do
      it 'is not empty after second fill move' do
        #Arrange
        grid = Grid.new
        grid.fill 3, 'yellow'

        #Act
        grid.fill 3, 'yellow'

        #Assert
        expect(grid.is_empty).to be_falsey
      end
    end

    context 'grid has a point in third column, and adds a new point in that column' do
      it 'has a not empty slot in second position of column' do
        #Arrange
        grid = Grid.new
        grid.fill 3, 'yellow'

        #Act
        grid.fill 3, 'yellow'

        #Assert
        expect(grid.disc_color_of_slot(3, 1)).not_to be_nil
      end
    end

    context 'grid has a point in fourth column, and adds a new point in that column' do

      let(:grid) {Grid.new}

      before do
        #Arrange
        grid.fill 4, 'yellow'

        #Act
        grid.fill 4, 'yellow'
      end

      #Assert
      it 'has a not empty slot in second position of column' do
        expect(grid.disc_color_of_slot(4, 1)).not_to be_nil
      end
      it 'has an empty slot in second position of another column' do
        expect(grid.disc_color_of_slot(3, 1)).to be_nil
      end
      it 'has an empty slot in third position of that column' do
        expect(grid.disc_color_of_slot(4, 2)).to be_nil
      end
    end

    context 'grid has a point in fifth column, and adds a new point in that column' do
      it 'has a not empty slot in second position of column' do
        #Arrange
        grid = Grid.new
        grid.fill 5, 'yellow'

        #Act
        grid.fill 5, 'yellow'

        #Assert
        expect(grid.disc_color_of_slot(5, 1)).not_to be_nil
      end
    end

    context 'grid has no point in column, and add a new point in that column' do

      let(:grid) {Grid.new}

      before do
        #Arrange

        #Act
        grid.fill 3, 'yellow'
      end

      #Assert
      it 'has an empty slot in second position of that column' do
        expect(grid.disc_color_of_slot(3, 1)).to be_nil
      end

      it 'has an filled slot in first position of that column' do
        expect(grid.disc_color_of_slot(3, 0)).not_to be_nil
      end

      it 'has an empty slot in first position of other column' do
        expect(grid.disc_color_of_slot(2, 0)).to be_nil
      end
    end

    context 'grid has 6 points in one column' do

      let(:grid) {Grid.new}

      before do
        #Arrange
        6.times {grid.fill 3, 'yellow'}

        #Act
      end

      #Assert
      it 'throws an NoAvailableSlot error when addind a 7th point in that column' do
        expect {grid.fill 3, 'yellow'}.to raise_error(NoAvailableSlotError)
      end

      it 'does not throw an error when adding a new point in another column' do
        expect {grid.fill 4, 'yellow'}.not_to raise_error
      end

      it 'does not throw an error when adding a new point in another column' do
        expect {grid.fill 5, 'yellow'}.not_to raise_error
      end
    end


    context 'grid is empty' do

      let(:grid) {Grid.new}

      #Assert
      it 'throws an ColumnNotExistingError error when addind a point in 8th column' do
        expect {grid.fill 7, 'yellow'}.to raise_error(ColumnNotExistingError)
      end

      it 'throws an ColumnNotExistingError error when addind a point -1th column' do
        expect {grid.fill -1, 'yellow'}.to raise_error(ColumnNotExistingError)
      end
    end
  end

  describe 'disc_color_of_slot' do
    context 'grid is empty and add a yellow disk in third column' do
      #Arrange
      let(:grid) {Grid.new}

      #Act
      before do
        grid.fill 2, 'yellow'
      end

      #Assert
      it 'has a yellow point in the third column and in the first row' do
        expect(grid.disc_color_of_slot 2, 0).to eq 'yellow'
      end
    end

    context 'grid is empty and add a red disk in third column' do
      #Arrange
      let(:grid) {Grid.new}

      #Act
      before do
        grid.fill 2, 'red'
      end

      #Assert
      it 'has a red point in the third column and in the first row' do
        expect(grid.disc_color_of_slot 2, 0).to eq 'red'
      end
    end

    context 'grid is empty and add a yellow disk in third column then add a red disk in the same column' do
      #Arrange
      let(:grid) {Grid.new}

      #Act
      before do
        grid.fill 2, 'yellow'
        grid.fill 2, 'red'
      end

      #Assert
      it 'has a yellow point in the third column and in the first row' do
        expect(grid.disc_color_of_slot 2, 0).to eq 'yellow'
      end
      it 'has a red point in the third column and in the second row' do
        expect(grid.disc_color_of_slot 2, 1).to eq 'red'
      end
    end

    context 'grid is empty and add a red disk in the third column then add a yellow disc in
 the fourth column then add a red point in the third column' do

      #Arrange
      let(:grid) {Grid.new}

      #Act
      before do
        grid.fill 2, 'red'
        grid.fill 3, 'yellow'
        grid.fill 2, 'red'
      end

      #Assert
      it 'has a red disk in the third column and in the first row' do
        expect(grid.disc_color_of_slot 2, 0).to eq 'red'
      end
      it 'has a red disk in the third column and in the second row' do
        expect(grid.disc_color_of_slot 2, 1).to eq 'red'
      end
      it 'has a yellow point in the fourth column and in the first row' do
        expect(grid.disc_color_of_slot 3, 0).to eq 'yellow'
      end
    end
  end
end