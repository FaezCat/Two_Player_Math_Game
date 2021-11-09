require "./Player_class.rb"

class Game

  attr_accessor :player1, :player2, :turn, :current_player, :game_state

  def initialize
    self.player1 = Player.new 
    self.player2 = Player.new
    self.turn = 0
    self.current_player = self.player1
    self.game_state = "playing"
  end

end