class DemandeMailer < ApplicationMailer

  def new_demande_email (demande)
    @demande = demande
    mail(to: 'seydou.ba@neticoa.fr', subject: 'Demande de congé')
  end

end
