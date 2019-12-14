require "byebug"
class Board
  attr_accessor :cups
  attr_reader :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index {|cup, i| 4.times {cup << :stone} unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..5).to_a.concat((6..12).to_a).include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    drop_in = (0...13).to_a if current_player_name == player1
    drop_in = (0..5).to_a.concat((7..13).to_a) if current_player_name == player2
    #debugger
    current_pos = start_pos
    moving_stones = []
    until cups[current_pos].empty?
      moving_stones << cups[current_pos].pop
    end
    until moving_stones.empty?
      current_pos += 1
      current_pos -= 14 if current_pos == 14
      cups[current_pos] << moving_stones.pop if drop_in.include?(current_pos)
    end
    render
    next_turn(current_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, player)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 && player == player1
      return :prompt
    elsif ending_cup_idx == 13 && player == player2
      return :prompt
    end
    
    if cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    case cups[6].length <=> cups[13].length
      when -1
        return player2
      when 0
        return :draw
      when 1
        return player1
    end
  end
end