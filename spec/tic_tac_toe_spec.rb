require_relative '../lib/tictactoe'

RSpec.describe Game do
  describe '#mark?' do
    context 'checks the behavior of #mark?' do
      subject { described_class.new }
      it 'checking for a valid input' do
        expect(subject.mark?(5, 'X')).to eql(true)
      end
      
      it 'checking for an invalid input' do
        expect(subject.mark?('five'.to_i, 'X')).to eql(false)
      end
    end
  end

  describe '#check_for_rows?' do
    context 'checks the behavior of #check_for_rows?' do
      subject { described_class.new }
      it 'the first row is a winner' do
        subject.board[0] = subject.board[1] = subject.board[2] = 'X'
        expect(subject.check_for_rows?).to eql(true)
      end

      it 'the first row is not a winner' do
        subject.board[0] = 'X'
        subject.board[1] = subject.board[2] = 'O'
        expect(subject.check_for_rows?).to eql(false)
      end
    end
  end

  describe '#check_for_columns?' do
    context 'checks the behavior of #check_for_columns?' do
      subject { described_class.new }
      it 'if the second column is a winner' do
        subject.board[1] = subject.board[4] = subject.board[7] = 'X'
        expect(subject.check_for_columns?).to eql(true)
      end

      it 'if the second column is not a winner' do
        subject.board[1] = 'X'
        subject.board[4] = subject.board[7] = 'O'
        expect(subject.check_for_columns?).to eql(false)
      end
    end
  end

  describe '#check_for_main_diagonal?' do
    context 'checks the behavior of #check_for_main_diagonal?' do
      subject { described_class.new }
      it 'the main diagonal is a winner' do
        subject.board[0] = subject.board[4] = subject.board[8] = 'X'
        expect(subject.check_for_main_diagonal?).to eql(true)
      end

      it 'the main diagonal is not a winner' do
        subject.board[0] = 'X'
        subject.board[4] = subject.board[8] = 'O'
        expect(subject.check_for_main_diagonal?).to eql(false || nil)
      end
    end
  end

  describe '#check_for_secondary_diagonal?' do
    it 'checks if #check_for_secondary_diagonal? is correctly checking if the secondary diagonal is a winner' do
      game = Game.new
      game.board[2] = game.board[4] = game.board[6] = 'X'
      expect(game.check_for_secondary_diagonal?).to eql(true)
    end

    it 'checks if #check_for_secondary_diagonal? is correctly checking if the secondary diagonal is a winner' do
      game = Game.new
      game.board[2] = 'X'
      game.board[4] = game.board[6] = 'O'
      expect(game.check_for_secondary_diagonal?).to eql(false || nil)
    end
  end

  describe '#winner?' do
    it 'checks if #winner? is correctly checking if one row, or one column or the main diagonal is a winner' do
      game = Game.new
      game.board[6] = game.board[7] = game.board[8] = 'X'
      expect(game.winner?).to eql(true)
    end

    it 'checks if #winner? is correctly checking if the third column is a winner' do
      game = Game.new
      game.board[6] = 'X'
      game.board[7] = game.board[8] = 'O'
      expect(game.winner?).to eql(false || nil)
    end
  end

  describe '#cats_game?' do
    it 'checks if #cats_game? is correctly evaluating a draw match' do
      game = Game.new
      game.board = %w[X O X O O X X X O]
      expect(game.cats_game?).to eql(true)
    end

    it 'checks if #cats_game? is correctly evaluating a draw match' do
      game = Game.new
      game.board = [1, 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
      expect(game.cats_game?).to eql(false)
    end
  end
end
