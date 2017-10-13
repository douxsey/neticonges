class DemandesController < ApplicationController
  def index
    @demandes = Demande.all
  end
  def new
  end

  def create
    # p 'les paramètres reçus', demande_params
    # demande_params << utilisateur_id: session[:user]['id']
    @demande = Demande.new(demande_params.merge(:utilisateur_id=>session[:user]['id']))
    if @demande.save
      redirect_to demandes_path, notice: 'Demande envoyée'
    else
      render new_demande_path
    end
  end
  def demande_params
    params.require(:demande).permit(:debut,:fin,:nb_jours,:type_conges,:motif)
  end
end
