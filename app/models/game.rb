class Game < ActiveRecord::Base
  has_and_belongs_to_many :players

  validate :game_has_2_players
  def game_has_2_players
    errors.add(:game, "must have 2 players") if players.count != 2
  end

end
