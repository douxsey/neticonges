class DemandeService

  def valider(demande)
    demande.valider
  end

  def refuser (demande,motif_refus)
  demande.refuser (motif_refus)
  end

  def get_by_id (id)
    Demande.where(id: id).first
  end
end
