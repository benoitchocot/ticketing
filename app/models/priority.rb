class Priority < ApplicationRecord
  has_many :tickets

  validates :title, presence: true, uniqueness: true
  validates :color, presence: true

  # 🔥 Autoriser explicitement les attributs pour Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "color", "created_at", "updated_at"]
  end
end
