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
    if warrior.feel.enemy? == true
      warrior.attack!
    elsif warrior.feel.captive? ==true
      warrior.rescue!
    elsif warrior.feel.empty? == true
      if @under_attack == true
        warrior.walk!
      elsif warrior.health >= @max_health
        warrior.walk!
      else
        warrior.rest!
      end
    end
 end
 
  def record_health(warrior)
    @health = warrior.health
  end
 
end
