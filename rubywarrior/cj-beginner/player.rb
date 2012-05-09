class Player
  def play_turn(warrior)
    warrior.feel.empty? ? rest_or_walk(warrior) : rest_or_attack(warrior)
    @@health = warrior.health
  end

  def rest_or_attack(warrior)
    if @@health
      if @@health < warrior.health
        warrior.walk!(back)
        warrior.rest!
      else
        warrior.attack!
      end
    else
      warrior.attack!
    end
  end

  def rest_or_walk(warrior)
      warrior.health < 20 ? warrior.rest! : warrior.walk! 
  end

end
