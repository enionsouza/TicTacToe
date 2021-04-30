#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/tic_tac_toe'

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
  error = !match.mark?(gets.chomp.to_i, game_players.match_players[player][:symbol])
  next if error

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
