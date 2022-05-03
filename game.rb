require './questions'

class Game 
  def initialize 
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
  end

  def turn
    if (@current_player == @player1)
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end 

  def generate_question(num1, num2)
    puts "what does #{num1} plus #{num2} equal?"
  end

  def check_answer(user_input, answer)
    if answer == user_input
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.remove_life
    end
  end

  def run_game
    question = Questions.new

    # puts "what does #{question.num1} plus #{question.num2} equal?"
    generate_question(question.num1, question.num2)

    print "> "
    user_input = Integer(gets.chomp)
    self.check_answer(user_input, question.answer)
    # puts @current_player.life

    if @current_player.life == 0
      winner = @current_player == @player1 ? @player2 : @player1
      puts "#{winner.name} wins with a score of #{winner.life}/3"
      puts "----- GAME OVER -----"
      return
    else
      puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
    end

    puts "----- NEW TURN -----"
    self.turn
    self.run_game
  end
end