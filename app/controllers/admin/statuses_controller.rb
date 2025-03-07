class Admin::StatusesController < ApplicationController
  before_action :set_status, only: %i[edit update destroy]

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to admin_statuses_path, notice: 'Statut créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @status.update(status_params)
      redirect_to admin_statuses_path, notice: 'Statut mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to admin_statuses_path, notice: 'Statut supprimé avec succès.'
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:title)
  end
end
