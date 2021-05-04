require_relative '../lib/tictactoe'

RSpec.describe Game do
  describe '#mark?' do
    context 'checks the behavior of #mark?' do
      subject { described_class.new }
      it 'valid input' do
        expect(subject.mark?(5, 'X')).to eql(true)
      end

      it 'invalid input' do
        expect(subject.mark?('five'.to_i, 'X')).to eql(false)
      end
    end
  end

  describe '#check_for_rows?' do
    context 'checks the behavior of #check_for_rows?' do
      subject { described_class.new }
      it 'first row is a winner' do
        subject.board[0] = subject.board[1] = subject.board[2] = 'X'
        expect(subject.check_for_rows?).to eql(true)
      end

      it 'first row is not a winner' do
        subject.board[0] = 'X'
        subject.board[1] = subject.board[2] = 'O'
        expect(subject.check_for_rows?).to eql(false)
      end
    end
  end

  describe '#check_for_columns?' do
    context 'checks the behavior of #check_for_columns?' do
      subject { described_class.new }
      it 'second column is a winner' do
        subject.board[1] = subject.board[4] = subject.board[7] = 'X'
        expect(subject.check_for_columns?).to eql(true)
      end

      it 'second column is not a winner' do
        subject.board[1] = 'X'
        subject.board[4] = subject.board[7] = 'O'
        expect(subject.check_for_columns?).to eql(false)
      end
    end
  end

  describe '#check_for_main_diagonal?' do
    context 'checks the behavior of #check_for_main_diagonal?' do
      subject { described_class.new }
      it 'main diagonal is a winner' do
        subject.board[0] = subject.board[4] = subject.board[8] = 'X'
        expect(subject.check_for_main_diagonal?).to eql(true)
      end

      it 'main diagonal is not a winner' do
        subject.board[0] = 'X'
        subject.board[4] = subject.board[8] = 'O'
        expect(subject.check_for_main_diagonal?).to eql(false || nil)
      end
    end
  end

  describe '#check_for_secondary_diagonal?' do
    context 'checks the behavior of #check_for_secondary_diagonal?' do
      subject { described_class.new }
      it 'secondary diagonal is a winner' do
        subject.board[2] = subject.board[4] = subject.board[6] = 'X'
        expect(subject.check_for_secondary_diagonal?).to eql(true)
      end

      it 'secondary diagonal is not a winner' do
        subject.board[2] = 'X'
        subject.board[4] = subject.board[6] = 'O'
        expect(subject.check_for_secondary_diagonal?).to eql(false || nil)
      end
    end
  end

  describe '#winner?' do
    context 'checks the behavior of #winner? for rows' do
      subject { described_class.new }
      it 'third row is a winner' do
        subject.board[6] = subject.board[7] = subject.board[8] = 'X'
        expect(subject.winner?).to eql(true)
      end

      it 'third row is not a winner' do
        subject.board[6] = 'X'
        subject.board[7] = subject.board[8] = 'O'
        expect(subject.winner?).to eql(false || nil)
      end
    end

    context 'checks the behavior of #winner? for columns' do
      subject { described_class.new }
      it 'third column is a winner' do
        subject.board[2] = subject.board[5] = subject.board[8] = 'X'
        expect(subject.winner?).to eql(true)
      end

      it 'third column is not a winner' do
        subject.board[2] = 'X'
        subject.board[5] = subject.board[8] = 'O'
        expect(subject.winner?).to eql(false || nil)
      end
    end

    context 'checks the behavior of #winner? for main diagonal' do
      subject { described_class.new }
      it 'main diagonal is a winner' do
        subject.board[0] = subject.board[4] = subject.board[8] = 'X'
        expect(subject.winner?).to eql(true)
      end

      it 'main diagonal is not a winner' do
        subject.board[0] = 'X'
        subject.board[4] = subject.board[8] = 'O'
        expect(subject.winner?).to eql(false || nil)
      end
    end

    context 'checks the behavior of #winner? for secondary diagonal' do
      subject { described_class.new }
      it 'secondary diagonal is a winner' do
        subject.board[2] = subject.board[4] = subject.board[6] = 'X'
        expect(subject.winner?).to eql(true)
      end

      it 'secondary diagonal is not a winner' do
        subject.board[2] = 'X'
        subject.board[4] = subject.board[6] = 'O'
        expect(subject.winner?).to eql(false || nil)
      end
    end
  end

  describe '#cats_game?' do
    context 'checks the behavior of #cats_game?' do
      subject { described_class.new }
      it 'draw match' do
        game = Game.new
        game.board = %w[X O X O O X X X O]
        expect(game.cats_game?).to eql(true)
      end

      it 'unfinished match' do
        game = Game.new
        game.board = [1, 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
        expect(game.cats_game?).to eql(false)
      end
    end
  end
end
