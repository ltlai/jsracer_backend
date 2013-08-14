class Player < ActiveRecord::Base
  has_and_belongs_to_many :games

  validates :name, presence: true, uniqueness: true

  def self.fetch(name)
    find_or_create_by_name(name)
  end
end
