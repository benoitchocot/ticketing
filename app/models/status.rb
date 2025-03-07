class Status < ApplicationRecord
  has_many :tickets

  validates :title, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "created_at", "updated_at"]
  end
end
