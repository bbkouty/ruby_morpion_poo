# lib/show.rb

class Show
  def initialize(board)
    @board = board
  end

  # Affiche le plateau de morpion
  def display_board
    puts
    puts "   1   2   3"
    puts "A  #{@board.cases['A1'].value} | #{@board.cases['A2'].value} | #{@board.cases['A3'].value}"
    puts "  ---+---+---"
    puts "B  #{@board.cases['B1'].value} | #{@board.cases['B2'].value} | #{@board.cases['B3'].value}"
    puts "  ---+---+---"
    puts "C  #{@board.cases['C1'].value} | #{@board.cases['C2'].value} | #{@board.cases['C3'].value}"
    puts
  end

  # Affiche un message d’infos
  def display_message(message)
    puts "👉 #{message}"
  end

  # Affiche le tour actuel
  def display_turn(player)
    puts "C’est au tour de #{player.name} (#{player.symbol})"
  end

  # Affiche le résultat de fin de partie
  def display_winner(winner)
    if winner
      puts "🎉 Bravo #{winner.name}, tu as gagné !"
    else
      puts "😅 Match nul !"
    end
  end
end
