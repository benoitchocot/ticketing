class Ticket < ApplicationRecord
  has_and_belongs_to_many :users
  has_rich_text :description


  belongs_to :priority
  belongs_to :status

  validates :title, presence: true
  validates :description, presence: true
  validates :priority_id, presence: true
  validates :status_id, presence: true
  validate :end_date_cannot_be_in_the_past

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "description", "created_at", "updated_at", "user_id"]
  end
  
  # 🔥 Autoriser explicitement les associations pour Ransack
  def self.ransackable_associations(auth_object = nil)
    ["priority", "status", "users"]
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "ne peut pas être dans le passé")
    end
  end
  
end
