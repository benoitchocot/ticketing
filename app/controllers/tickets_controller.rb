class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :soft_delete, :restore]
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:archived, :restore]

  def index
    @users = User.all # Récupère tous les utilisateurs pour le filtre
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets.where.not(status_id: Status.find_by(title: 'Fermé').id)
    end

    @q = current_user.admin? ? Ticket.active.ransack(params[:q]) : current_user.tickets.active.ransack(params[:q])
    @tickets = @q.result(distinct: true)
  end

  # Action pour afficher les tickets archivés
  def archived
    @tickets = Ticket.archived
  end


  def restore
    @ticket.restore
    redirect_to archived_tickets_path, notice: 'Le ticket a été restauré avec succès.'
  end

  def soft_delete
    if @ticket.update_column(:deleted_at, Time.current)
      redirect_to tickets_path, notice: 'Le ticket a été archivé avec succès.'
    else
      redirect_to tickets_path, alert: 'Erreur lors de l\'archivage du ticket.'
    end
  end
  
  def show
    if current_user.admin? || @ticket.status.title != 'Fermé'
      # Continue avec la logique d'affichage du ticket
    else
      redirect_to tickets_path, alert: "Vous ne pouvez pas voir ce ticket car il est fermé."
    end
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

  

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :priority_id, :status_id, :end_date, user_ids: [])
  end
  
  def authorize_admin
    unless current_user.admin?
      redirect_to tickets_path, alert: "Accès refusé : vous n'êtes pas administrateur."
    end
  end
end
