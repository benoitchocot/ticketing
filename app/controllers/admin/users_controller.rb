class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "Utilisateur créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @user est déjà défini grâce au before_action :set_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'L\'utilisateur a été mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Utilisateur supprimé avec succès.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit" unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id]) # Trouver l'utilisateur avec son ID
  end
end
