class Users::RegistrationsController < Devise::RegistrationsController
  # Empêcher les utilisateurs non-admin de s'inscrire
  def new
    if current_user && current_user.admin?
      super
    else
      redirect_to root_path, alert: "Vous n'avez pas la permission de créer un compte."
    end
  end

  def create
    if current_user && current_user.admin?
      super
    else
      redirect_to root_path, alert: "Vous n'avez pas la permission de créer un compte."
    end
  end
end
