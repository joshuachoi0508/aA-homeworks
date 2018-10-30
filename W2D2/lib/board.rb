class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = [
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    [:stone, :stone, :stone, :stone],
    []]
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    movement = self.cups[start_pos].length

    self.cups[start_pos] = []

    i = start_pos + 1
    while movement > 0
      if i > 14
        i = 0
      end

      if @player1 == current_player_name && i == 13
        i += 1
        next
      elsif @player2 == current_player_name && i == 6
        i += 1
        next
      else
        
        self.cups[i] << :stone
        i += 1
        movement -= 1
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
