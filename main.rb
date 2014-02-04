class Player
 
  def play_turn(warrior)
    @max_health = 20
    if @health == nil then @health = @max_health end
    is_taking_damage?(warrior)
    actions(warrior)
    record_health(warrior)
  end
 
  def is_taking_damage?(warrior)
    #checks current health vs previous health to see if we are being attacked
    @under_attack = @health > warrior.health
  end
 
  def actions(warrior) 
  #potential actions the warrior can take to respond to situations
    if @under_attack == true 
      if warrior.feel.enemy? == true
        warrior.attack!
      else
        warrior.walk!
      end
    elsif warrior.health >= @max_health
      if warrior.feel.enemy?
        warrior.attack!
      else
        warrior.walk!
      end
    else
      warrior.rest!
    end
  end
 
  def record_health(warrior)
    @health = warrior.health
  end
 
end
