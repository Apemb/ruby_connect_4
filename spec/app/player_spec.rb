require 'rspec'
require_relative('../../app/player')


describe Player do
  describe 'initialize' do

    it 'keeps the player chosen color when yellow' do
      #Arrange
      #Act
      player = Player.new 'yellow'

      #Assert
      expect(player.color).to eq 'yellow'
    end

    it 'keeps the player chosen color when red' do
      #Arrange
      #Act
      player = Player.new 'red'

      #Assert
      expect(player.color).to eq 'red'
    end
  end
end