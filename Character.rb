class Character
  attr_accessor :name, :hp, :attack_dmg

  def initialize(name, hit_point, attack_dmg)
    @name = name
    @hp = hit_point
    @attack_dmg = attack_dmg
  end

  def receive_damage(damage)
    @hp -= damage
  end

  def attack(other_player)
    puts attacking_event(other_player)
    other_player.receive_damage(@attack_dmg)
  end

  def attacking_event(other_player)
    "#{@name} attacks #{other_player.name} with #{@attack_dmg} damage"
  end

  def to_s
    "#{@name} has #{@hp} hit points and #{@attack_dmg} attack damage"
  end

  def died?
    @hp <= 0
  end
end