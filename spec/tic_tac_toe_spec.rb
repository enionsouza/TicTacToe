require_relative '../lib/tictactoe'

RSpec.describe Game do
  describe "#mark?" do
    it "checks if #mark? is correctly marking the board" do
      game = Game.new
      expect(game.mark?(5, 'X')).to eql(true)
    end

    it "checks if #mark? is returning false for invalid input" do
      game = Game.new
      expect(game.mark?('five'.to_i, 'X')).to eql(false)
    end
  end

  describe "#check_for_rows?" do
    it "checks if #check_for_rows? is correctly checking if the first row is a winner" do
      game = Game.new
      game.board[0] = game.board[1] = game.board[2] = 'X'
      expect(game.check_for_rows?).to eql(true)
    end

    it "checks if #check_for_rows? is correctly checking if the first row is a winner" do
      game = Game.new
      game.board[0] = 'X'
      game.board[1] = game.board[2] = 'O'
      expect(game.check_for_rows?).to eql(false)
    end
  end
end
