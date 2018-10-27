class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    inputted_seq = require_sequence

    if check_sequence(inputted_seq)
      round_success_message
    else
      self.game_over = true
    end

    self.sequence_length += 1
  end

  def check_sequence(inputted_seq)
    seq == inputted_seq
  end

  def show_sequence
    add_random_color
    puts "#{self.seq}"
  end

  def require_sequence
    puts "WHAT'S THE SEQUENCE? (INPUT EXAMPLE: color, color, color)"
    player_sequence = gets.chomp.split(",")
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "ROUND COMPLETE"
  end

  def game_over_message
    puts "WRONG! GAME OVER"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
