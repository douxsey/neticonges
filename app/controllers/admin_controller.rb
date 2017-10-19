class AdminController < ApplicationController

  def index
    @demandes = Demande.where(acceptee: nil);
  end

  def valider
    demande = serviceDemande.get_by_id(params[:id_demande])
    if not demande
      flash[:danger] = "La demande n'existe pas"
    elsif serviceDemande.valider(demande)
      flash[:info] = "Demande acceptée"
    else
      flash[:danger] = "Erreur lors de la validation"
    end

    redirect_to admin_demande_path
  end

  def refuser
    demande = serviceDemande.get_by_id(params[:id_demande])
    if not demande
      flash[:danger] = "La demande n'existe pas"
    elsif serviceDemande.refuser(demande,params[:refus_motif])
      flash[:info] = "Demande refusée"
    else
      flash[:danger] = "Erreur lors de la validation"
    end

    redirect_to admin_demande_path
  end
  def show
    @demande = serviceDemande.get_by_id(params[:id_demande])
  end
  def serviceDemande
    serviceDemande ||= DemandeService.new
  end

end
