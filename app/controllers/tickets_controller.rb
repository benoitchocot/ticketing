class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all # Récupère tous les utilisateurs pour le filtre
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end


    @q = Ticket.ransack(params[:q])
    if current_user.admin?
      @tickets = @q.result(distinct: true)
    end
    
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket supprimé avec succès.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :priority_id, :status_id, :end_date, user_ids: [])
  end
  
  
end
