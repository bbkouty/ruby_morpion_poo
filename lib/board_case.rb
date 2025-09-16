# lib/board_case.rb
class BoardCase
  attr_reader :position
  attr_accessor :value

  VALID_VALUES = [" ", "X", "O"].freeze

  def initialize(position, value = " ")
    @position = position
    @value = value
    validate!
  end

  # Vérifie si la case est vide
  def empty?
    value == " "
  end

  # Remplit la case avec un symbole ('X' ou 'O')
  def fill!(symbol)
    raise ArgumentError, "La case n'est pas vide" unless empty?
    raise ArgumentError, "Symbole invalide" unless %w[X O].include?(symbol)
    @value = symbol
  end

  # Représentation lisible
  def to_s
    value
  end

  private
  
    def validate!
        raise ArgumentError, "Position invalide" if position.empty?
        raise ArgumentError, "Valeur invalide" unless VALID_VALUES.include?(value)
    end
end
