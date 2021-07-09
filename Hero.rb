require_relative './Character'

class Hero < Character
  def deflect_probability
    rand(1..5)
  end

  def deflect_attack?(probability = deflect_probability)
    probability < 5
  end

  def heal(ally)
    puts print_healing_event(ally)
    ally.hp += 20
  end

  def print_healing_event(ally)
     "#{@name} heals #{ally.name}, restoring 20 points"
  end

  def receive_damage(damage, assigned_deflect_probability = nil)
    probability = assigned_deflect_probability || deflect_probability
    if deflect_attack?(probability)
      puts "#{@name} deflected the attack"
    else
      super(damage)
    end
  end
end