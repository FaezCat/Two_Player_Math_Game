require "./Game_class.rb"
require "./Player_class.rb"

def random_number_generator
  rand(1..20)
end

newGame = Game.new

until newGame.game_state == "complete" do
  
  num1 = random_number_generator
  num2 = random_number_generator

  question_answer = num1 + num2
  # puts question_answer.class
  
  display_name = "Player 1"
  
  if newGame.current_player == newGame.player1
    display_name = "Player 1"
  else
    display_name = "Player 2"
  end
    
  
  # initial welcome to game
  if newGame.turn == 0
    puts "Welcome to the Two Player Math Game!"
    newGame.turn += 1
  end

  # each round's question using randomly generated values
  puts "#{display_name}: What does #{num1} plus #{num2} equal?"
  
  player_answer = gets.chomp
  # puts player_answer.class
  
  # check to see if player answered correctly
  if player_answer.to_i == question_answer.to_i
    puts "#{display_name}: YES! You are correct."
  else 
    
    # current player losing 1 life if they answered incorrectly
    if newGame.current_player == newGame.player1
      newGame.player1.player_life -= 1
      if newGame.player1.player_life != 0
        puts "#{display_name}: Seriously? No!"
      end
    else
      newGame.player2.player_life -= 1
      if newGame.player2.player_life != 0
        puts "#{display_name}: Seriously? No!"
      end
    end
  end

  # verbiage and logic if the current player still has lives remaining
  if newGame.current_player.player_life != 0
    if newGame.current_player == newGame.player1
      puts "P1: #{newGame.player1.player_life}/3 vs P2: #{newGame.player2.player_life}/3"
    else
      puts "P2: #{newGame.player2.player_life}/3 vs P1: #{newGame.player1.player_life}/3"
    end
    puts "----- NEW TURN -----"
  else
    # verbiage and logic if the current player lost their final life
    if newGame.current_player == newGame.player1
      puts "Player 2 wins with a score of #{newGame.player2.player_life}/3"
    else
      puts "Player 1 wins with a score of #{newGame.player1.player_life}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
    newGame.game_state = "complete"
  end
  
  if newGame.current_player == newGame.player1
    newGame.current_player = newGame.player2
  else 
    newGame.current_player = newGame.player1
  end

end