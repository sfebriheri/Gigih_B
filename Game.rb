require_relative './Hero'

class Game
  attr_accessor :hero, :enemies, :is_finished, :winner

  def initialize(hero: nil, allies: nil, enemies: nil)
    @hero = hero
    @allies = allies
    @enemies = enemies
    @is_finished = false
    @turn = 1
  end

  def get_user_input
    puts 'Your choice: '
    user_input = gets.chomp
    user_input.to_i
  end

  def print_hero_turn_choice
    puts "as #{@hero.name}, what do you want to do in this turn?"
    puts '1) Attack an enemy'
    puts '2) Heal an ally'
  end

  def print_attackable_enemies
    @enemies.each_with_index do |enemy, index|
      puts "#{index}) #{enemy.name}"
    end
  end

  def print_attacking_choices
    puts 'Which enemy that you want to attack?'
    print_attackable_enemies
  end

  def print_healable_allies
    @allies.each_with_index do |ally, index|
      puts "#{index}) #{ally.name}"
    end
  end

  def print_healing_choices
    puts 'Which ally you want to heal?'
    print_healable_allies
  end

  def allies_attacking
    @allies.each do |ally|
      attacked = @enemies.sample
      ally.attack(attacked)
      check_enemies_response(attacked)
      break if @enemies.empty?
    end
  end

  def hero_turn_when_attacking
    print_attacking_choices
    user_choice = get_user_input
    puts "\n"
    @hero.attack(@enemies[user_choice])
    check_enemies_response(@enemies[user_choice])
  end

  def hero_turn_when_healing
    print_healing_choices
    user_choice = get_user_input
    puts "\n"
    @hero.heal(@allies[user_choice])
  end

  def do_hero_turn
    print_hero_turn_choice
    user_choice = get_user_input
    puts "\n"
    case user_choice
    when 1
      hero_turn_when_attacking
    when 2
      hero_turn_when_healing
    end
  end

  def enemy_attacking
    @enemies.each do |enemy|
      attacked = [@hero, *@allies].sample
      enemy.attack(attacked)
      check_alliance_response(attacked)
      break if @hero.died?
    end
  end

  def check_alliance_response(attacked)
    if attacked.died?
      puts "#{attacked.name} dies"
      @allies.delete_if { |char| char.name == attacked.name }
    end
  end

  def check_enemies_response(attacked)
    if attacked.died?
      puts "#{attacked.name} dies"
      @enemies.delete_if { |char| char.name == attacked.name }
    elsif  attacked.fleeing?
      puts "#{attacked.name} flees from the battlefield"
      @enemies.delete_if { |char| char.name == attacked.name }
    end
  end

  def finished?
    @hero.died? || @enemies.empty?
  end

  def print_character_stats
    puts 'Character Stats:'
    puts @hero
    @allies.each do |ally|
      puts ally
    end
    puts "\n"
    @enemies.each do |enemy|
      puts enemy
    end
    puts "\n"
  end

  def print_turns
    puts "\n"
    puts "============ Turn #{@turn} ============"
  end

  def start_game
    loop do
      puts "\n"
      print_turns
      print_character_stats
      do_hero_turn
      break if finished?

      allies_attacking
      break if finished?

      enemy_attacking
      break if finished?

      @turn += 1
    end
  end

  def print_battle_result
    puts "\n"
    if @hero.died?
      puts 'The hero is dead.'
      puts 'Game over.'
    else
      puts "#{@hero.name} wins."
    end
  end
end