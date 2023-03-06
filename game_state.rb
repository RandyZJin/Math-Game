class Game_state
  attr_accessor :current_player, :players
  
  def initialize(player1, player2)
    self.current_player = player1
    self.players = [player1, player2]
    p self.players
  end

  def player
    if self.current_player == players[0]
      "Player 1"
    else 
      "Player 2"
    end
  end

  def question(num1, num2)
    puts "#{self.player}: What is #{num1} + #{num2}?"
    answer = gets.chomp
    if answer.to_i == num1 + num2
      puts "Nice #{self.player}"
    else
      puts "#{self.player}, please learn math!"
      self.current_player.lives -= 1
    end
    self.player_switch
  end

  def player_switch
    if self.current_player == players[0]
      self.current_player = players[1]
    else 
      self.current_player = players[0]
    end
    "Player1 #{players[0].lives}/3 vs  Player2 #{players[1].lives}/3"
  end


  def new_turn
    if players[0].lives > 0 && players[1].lives > 0
      puts "--- NEW TURN ---"
    else
      self.results
    end
  end

  def results
    if players[1].lives == 0
      puts "Player 1 wins with a score of #{players[0].lives}/3"
    else 
      puts "Player 2 wins with a score of #{players[1].lives}/3"
    end
    puts "--- GAME OVER ---"
    puts "Thanks for playing!"
  end

end