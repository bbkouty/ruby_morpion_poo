# lib/board.rb
require_relative 'board_case'

class Board
  attr_reader :cases, :turn_count

  WINNING_COMBOS = [
    %w[A1 A2 A3], %w[B1 B2 B3], %w[C1 C2 C3], # lignes
    %w[A1 B1 C1], %w[A2 B2 C2], %w[A3 B3 C3], # colonnes
    %w[A1 B2 C3], %w[A3 B2 C1]               # diagonales
  ].freeze

  # Initialise le plateau avec 9 cases vides
  def initialize
    @cases = {}
    %w[A B C].each do |row|
      (1..3).each do |col|
        pos = "#{row}#{col}"
        @cases[pos] = BoardCase.new(pos)
      end
    end
    @turn_count = 0
  end

  # Vérifie si un coup est valide (case existe et est vide)
  def valid_move?(position)
    cases.key?(position) && cases[position].empty?
  end

  # Joue un coup (remplit une case avec un symbole)
  def play_move(position, symbol)
    raise ArgumentError, "Coup invalide" unless valid_move?(position)
    cases[position].fill!(symbol)
    @turn_count += 1
  end

  # Vérifie s'il y a un gagnant, retourne 'X', 'O' ou nil
  def winner
    WINNING_COMBOS.each do |combo|
      values = combo.map { |pos| cases[pos].value.upcase }  # uniformisation
      if values.uniq.size == 1 && values.first != " "
        return values.first  # renvoie "X" ou "O"
      end
    end
    nil
  end


  # Vérifie si le plateau est plein (match nul possible)
  def full?
    turn_count >= 9
  end

  # Vérifie si la partie est terminée (victoire ou nul)
  def game_over?
    winner || full?
  end

  # Retourne une version texte du plateau (pour debug ou affichage simple)
  def to_s
    rows = %w[A B C].map do |row|
      (1..3).map { |col| cases["#{row}#{col}"].to_s }.join(" | ")
    end
    rows.join("\n---------\n")
  end
end
