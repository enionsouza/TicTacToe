#!/usr/bin/env ruby
require 'colorize'
# require '../lib/TicTacToe.rb'

class Game
  # Class to be implemented inside TicTacToe Module
  attr_reader :board, :victory

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
    result = false
    result ||= check_for_rows?
    result ||= check_for_columns?
    result ||= check_for_main_diagonal?
    result ||= check_for_secondary_diagonal?
    result
  end

  def cats_game?
    @board.all?(String)
  end
end

class Players
  # To be implemented inside TicTacToe Module
  attr_reader :match_players

  def initialize(name1, name2)
    @match_players = [
      { name: name1, symbol: 'X' },
      { name: name2, symbol: 'O' }
    ]
  end
end

def clear_screen
  system('cls') || system('clear')
end

def print_board(board, victory)
  clear_screen
  cell = 0
  puts_color(' ' * 15)
  (0..2).each do |i|
    print_color(' ' * 3)
    (0..2).each do |j|
      print_color(board[cell], victory[cell])
      cell += 1
      print_color(' │ ') if j < 2
    end
    puts_color(' ' * 3)
    puts_color('  ───┼───┼───  ') if i < 2
  end
  puts_color(' ' * 15)
end

def puts_color(str)
  puts str.light_white.on_black
end

def print_color(str, green = nil)
  str = str.to_s
  green ? (print str.light_green.on_black) : (print str.light_white.on_black)
end

clear_screen
puts '>>>>>WELCOME TO TIC TAC TOE GAME!<<<<<'.light_yellow
puts "In this game, the first player will mark X's (crosses) and the second player will mark O's (noughts)..."
print 'First player, please, enter your name: '.yellow
name1 = gets.chomp
name1 = name1 == '' ? 'Player1' : name1
print 'Second player, please, enter your name: '.yellow
name2 = gets.chomp
name2 = name2 == '' ? 'Player2' : name2

game_players = Players.new(name1, name2)

match = Game.new
player = 0
error = false
loop do
  print_board(match.board, match.victory)
  puts 'Invalid number!'.red.on_black if error
  print "#{game_players.match_players[player][:name]}, please, choose one of the available numbers to play: "
  if match.mark?(gets.chomp.to_i, game_players.match_players[player][:symbol])
    error = false
  else
    error = true
    next
  end

  if match.winner?
    print_board(match.board, match.victory)
    puts "#{game_players.match_players[player][:name]} wins!!!".green.on_black
    break
  end
  if match.cats_game?
    print_board(match.board, match.victory)
    puts 'Cats Game! No winners for this match!'.red.on_black
    break
  end
  player = player == 1 ? 0 : 1
end
