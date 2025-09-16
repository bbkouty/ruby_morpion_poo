# lib/game.rb
require_relative 'board'
require_relative 'show'

class Game
  attr_reader :players, :board, :show

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Board.new
    @show = Show.new(@board)
    @current_player_index = 0
  end

  # Démarre une partie
  def play
    show.display_message("Bienvenue dans le jeu du Morpion !")
    show.display_board

    until board.game_over?
      
      current_player = players[@current_player_index]
      show.display_turn(current_player)

      position = ask_move(current_player)
      board.play_move(position, current_player.symbol)
      
      # Nettoyer l'écran à chaque tour
      system("clear") || system("cls")
      
      show.display_board
      
      winning_symbol = board.winner
      if winning_symbol
        winner_player = players.find { |p| p.symbol.upcase == winning_symbol }
        show.display_winner(winner_player)
        return
      end

      switch_player
    end

    show.display_winner(nil) # match nul
  end

  private

  def ask_move(player)
    position = nil
    loop do
      print "#{player.name}, choisis une case (ex: A1, B3) : "
      position = gets.chomp.upcase
      break if board.valid_move?(position)

      show.display_message("❌ Mauvais choix, recommence.")
    end
    position
  end

  def switch_player
    @current_player_index = 1 - @current_player_index
  end
end
