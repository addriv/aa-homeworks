require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      4.times do
        cup << :stone  unless i == 6 || i == 13
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > @cups.length || start_pos < 0
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Empty starting cup"
    else
      true
    end
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      cup = @cups[start_pos]
      idx = start_pos

      until cup.empty?
        idx += 1
        stone = cup.pop
        if idx > 13
          idx = 0
        elsif current_player_name == @player1.name
          idx = 0 if idx == 13
        elsif current_player_name == @player2.name
          idx = 7 if idx == 6
        end
        @cups[idx] << stone
      end

      render
      next_turn(idx)
    end
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    case player1_score <=> player2_score
    when 0
      return :draw
    when 1
      @player1.name
    when -1
      @player2.name
    end
  end
end
