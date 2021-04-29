#!/usr/bin/env ruby
require 'colorize'
# require '../lib/TicTacToe.rb'

class Game
  # Class to be implemented inside TicTacToe Module
  attr_reader :board, :victory

  def initialize(game_players)
    @board = (1..9).to_a
    @victory = Array.new(9, false)
    puts "TicTacToe Game Class #{game_players}"
  end

  def mark?(number)
    puts "TicTacToe Game Class #{number}"
  end

  def winner?
    puts 'TicTacToe Game Class'
  end

  def cats_game?
    puts 'TicTacToe Game Class'
  end
end

class Players
  # To be implemented inside TicTacToe Module
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    puts "TicTacToe Players Class #{@name1} and #{@name2}"
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

match = Game.new(game_players)
player = 0
loop do
  print_board(match.board, match.victory)
  print "#{game_players.name1}, please, choose one of the available numbers to play: "
  next unless match.mark?(gets.chomp.to_i)

  if match.winner?
    print_board(match.board, match.victory)
    puts "#{game_players.name1} wins!!!".green.on_black
    break
  end
  if match.cats_game?
    print_board(match.board, match.victory)
    puts 'Cats Game! No winners for this match!'.red.on_black
    break
  end
  player = player == 1 ? 0 : 1
end
