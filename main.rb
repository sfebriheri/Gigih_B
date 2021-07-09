require_relative './CharacterFactory'
require_relative './Game'

def start_game
  jin = create_char('Jin Sakai', 200, 50, is_hero: true)
  yuna = create_char('Yuna', 150, 50)
  sensei = create_char('Sensei Ishihara', 180, 60)
  archer = create_char('Mongol archer', 120, 30, is_archer: true)
  swordsman = create_char('Mongol swordsman', 150, 50, is_swordsman: true)
  spearman = create_char('Mongol spearman', 130, 60, is_spearman: true)
  initial_chars = {
    hero: jin,
    allies: [yuna, sensei],
    enemies: [archer, swordsman, spearman]
  }
  game = Game.new(**initial_chars)
  game.start_game
  game.print_battle_result
end

start_game