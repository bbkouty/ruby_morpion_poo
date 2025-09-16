# lib/player.rb
class Player
  attr_reader :name, :symbol

  VALID_SYMBOLS = %w[X O].freeze

  def initialize(name, symbol)
    @name = sanitize_name(name)
    @symbol = sanitize_symbol(symbol)
    validate!
  end

  # Représentation lisible
  def to_s
    "#{name} (#{symbol})"
  end

  def self.from_input(prompt_name = "Nom du joueur", symbol_taken = nil)
    print "#{prompt_name} : "
    name = STDIN.gets&.chomp.to_s

    symbol = nil
    loop do
      print "Choisissez un symbole (X/O)#{symbol_taken ? " — '#{symbol_taken}' déjà pris" : ""} : "
      symbol = STDIN.gets&.chomp.to_s.upcase
      break if VALID_SYMBOLS.include?(symbol) && symbol != symbol_taken
      puts "Symbole invalide ou déjà pris, réessayez."
    end

    new(name, symbol)
  end

  private

    def sanitize_name(name)
        name.to_s.strip
    end

    def sanitize_symbol(symbol)
        symbol.to_s.upcase
    end

    def validate!
        raise ArgumentError, 'Le nom doit être une chaîne non vide' if name.empty?
        unless VALID_SYMBOLS.include?(symbol)
        raise ArgumentError, "Symbole invalide — doit être 'X' ou 'O'"
        end
    end
end
