class Game
  attr_accessor :board, :victory

  def initialize
    @board = (1..9).to_a
    @victory = Array.new(9, false)
  end

  def mark?(number, symbol)
    return false if number < 1 || number > 9 || number != @board[number - 1]

    @board[number - 1] = symbol
    true
  end

  def check_for_rows?
    (1..9).step(3).each do |i|
      if @board[i - 1] == @board[i] && @board[i] == @board[i + 1]
        return @victory[i - 1] = @victory[i] = @victory[i + 1] = true
      end
    end
    false
  end

  def check_for_columns?
    (3..5).each do |i|
      if @board[i - 3] == @board[i] && @board[i] == @board[i + 3]
        return @victory[i - 3] = @victory[i] = @victory[i + 3] = true
      end
    end
    false
  end

  def check_for_main_diagonal?
    @victory[0] = @victory[4] = @victory[8] = true if @board[0] == @board[4] && @board[4] == @board[8]
  end

  def check_for_secondary_diagonal?
    @victory[2] = @victory[4] = @victory[6] = true if @board[2] == @board[4] && @board[4] == @board[6]
  end

  def winner?
    check_for_rows? || check_for_columns? || check_for_main_diagonal? || check_for_secondary_diagonal?
  end

  def cats_game?
    @board.all?(String)
  end
end
