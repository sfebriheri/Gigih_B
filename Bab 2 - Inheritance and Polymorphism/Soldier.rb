require_relative '../Character'

class Soldier < Character
  def fleeing?
    fleeing_chance = rand(1..4)
    fleeing_chance < 3 && @hp < 50
  end
end

class Archer < Soldier
    def print_attacking_event(other_player)
      puts "#{@name} shot #{other_player.name} with #{@attack_dmg} damage"
    end
end

class Spearman < Soldier
    def print_attacking_event(other_player)
      puts "#{@name} thrusted #{other_player.name} with #{@attack_dmg} damage"
    end
end

class Swordsman < Soldier
    def print_attacking_event(other_player)
      puts "#{@name} slashed #{other_player.name} with #{@attack_dmg} damage"
    end
end