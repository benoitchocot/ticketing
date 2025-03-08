class User < ApplicationRecord
  has_and_belongs_to_many :tickets

  validates :email, presence: true
  validates :role, presence: true
    # Méthode pour autoriser la recherche sur certains attributs
    def self.ransackable_attributes(auth_object = nil)
      # Liste des attributs que tu veux rendre recherchables
      ["created_at", "email", "id", "role", "updated_at"]
    end
    
    # Pour ransack, tu peux aussi ajouter cette ligne si tu veux filtrer par ticket
    def self.ransackable_associations(auth_object = nil)
      ["tickets"]
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Définition des rôles
  enum :role, { user: "user", admin: "admin" }
  def admin?
    role == 'admin'
  end
  # Validation pour le rôle
  validates :role, inclusion: { in: roles.keys }
end

