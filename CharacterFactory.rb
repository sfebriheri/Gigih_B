require_relative './Character'
require_relative './Hero'
require_relative './Bab 2 - Inheritance and Polymorphism/Soldier'



def create_char(name, hit_point, attack_dmg, options = {})
  return Hero.new(name, hit_point, attack_dmg) if options[:is_hero]
  return Archer.new(name, hit_point, attack_dmg) if options[:is_archer]
  return Swordsman.new(name, hit_point, attack_dmg) if options[:is_swordsman]
  return Spearman.new(name, hit_point, attack_dmg) if options[:is_spearman]

  Character.new(name, hit_point, attack_dmg)
end