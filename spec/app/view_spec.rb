require 'rspec'
require_relative('../../app/view')
require_relative('../../app/grid')
require_relative('../../app/player')

describe View do
  describe 'get_player_input' do
    #Arrange
    let(:console) {spy('console')}
    let(:view) {View.new console}
    let(:grid) {Grid.new}
    let(:player) {Player.new 'yellow'}

    #Act
    before do
      view.get_player_input grid, player
    end

    #Assert
    it 'displays the message telling which player turn it is' do
      expected_first_message = 'C\'est au joueur 1'
      expect(console).to have_received(:puts).with(expected_first_message)
    end
  end
end