class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    loop do
      take_turn
      if !game_over
        round_success_message
      else
        game_over_message
        reset_game
      end
    end
  end

  def take_turn
    show_sequence
    require_sequence
  end

  def show_sequence
    add_random_color
    seq.each do |ele|
      puts ele
      sleep(1.5)
      system("clear")
    end
  end

  def require_sequence
    count = 0
    while count < seq.length
      color = gets.chomp
      if color != seq[count]
        @game_over = true
        break
      end
      count += 1
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "CORRECT!"
  end

  def game_over_message
    puts "YOU LOSE"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

a = Simon.new
a.play

