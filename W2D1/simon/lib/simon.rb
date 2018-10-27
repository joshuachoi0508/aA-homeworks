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
    require_sequence
    round_success_message
    add_random_color
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "ROUND COMPLETE"
  end

  def game_over_message

  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
