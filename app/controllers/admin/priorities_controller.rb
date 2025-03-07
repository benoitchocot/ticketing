class Admin::PrioritiesController < ApplicationController
  before_action :set_priority, only: %i[edit update destroy]

  def index
    @priorities = Priority.all
  end

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priority_params)
    if @priority.save
      redirect_to admin_priorities_path, notice: 'Priorité créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @priority.update(priority_params)
      redirect_to admin_priorities_path, notice: 'Priorité mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @priority.destroy
    redirect_to admin_priorities_path, notice: 'Priorité supprimée avec succès.'
  end

  private

  def set_priority
    @priority = Priority.find(params[:id])
  end

  def priority_params
    params.require(:priority).permit(:title, :color)
  end
end
