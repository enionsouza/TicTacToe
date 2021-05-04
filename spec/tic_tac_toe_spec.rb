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
      expect(game.check_for_rows?).to eql(false || nil)
    end
  end

  describe "#check_for_columns?" do
    it "checks if #check_for_columns? is correctly checking if the second column is a winner" do
      game = Game.new
      game.board[1] = game.board[4] = game.board[7] = 'X'
      expect(game.check_for_columns?).to eql(true)
    end

    it "checks if #check_for_columns? is correctly checking if the second column is a winner" do
      game = Game.new
      game.board[1] = 'X'
      game.board[4] = game.board[7] = 'O'
      expect(game.check_for_columns?).to eql(false || nil)
    end
  end

  describe "#check_for_main_diagonal?" do
    it "checks if #check_for_main_diagonal? is correctly checking if the main diagonal is a winner" do
      game = Game.new
      game.board[0] = game.board[4] = game.board[8] = 'X'
      expect(game.check_for_main_diagonal?).to eql(true)
    end

    it "checks if #check_for_main_diagonal? is correctly checking if the main diagonal is a winner" do
      game = Game.new
      game.board[0] = 'X'
      game.board[4] = game.board[8] = 'O'
      expect(game.check_for_main_diagonal?).to eql(false || nil)
    end
  end
end
