class Player
  @@score = 0

  def get_score
    @@score
  end

  def win
    @@score += 1
  end

  def lose
    @@score -= 1
  end
end

class Game
  @@num1 = rand(10)
  @@num2 = rand(10)

  def start_game
    "What is #{@@num1} plus #{@@num2}?"
  end

  def get_result(num)
    @@num1 + @@num2 == num ? true : false
  end

  def result_msg(num)
    @@num1 + @@num2 == num ? "correct!" : "wrong!"
  end

  def restart
    @@num1 = rand(10)
    @@num2 = rand(10)
  end
end



def play
  p1 = Player.new
  p2 = Player.new
  cur = p1
  prev = p2
  game = Game.new

  while p1.get_score < 3 || p2.get_score < 3 do
    puts '---- NEW TURN ----'
    num = cur == p1 ? 1 : 2
    num2 = cur == p1 ? 2 : 1
    puts "Player #{num}: " + game.start_game
    ans = gets.to_i
    puts "Player #{num}: " + game.result_msg(ans)
    if game.get_result(ans)
      prev.win
    end
    if prev.get_score < 3
      puts "P1: #{p1.get_score}/3 vs P2: #{p2.get_score}/3"
    else
      puts "Player #{num2} wins"
    end
    cur, prev = prev, cur
    game.restart
  end
  puts "---- GAME OVER ----\nGood bye!"
end



play()
