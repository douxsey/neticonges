class Demande < ApplicationRecord
  belongs_to :utilisateur
  enum type_conges: {
    conge_paye: 'Congés payés',
    conge_maladie: 'Congés maladie',
    conge_non_paye: 'Congés non payés'
  }
  validates :debut,
    presence: {message: ' du congé obligatoire'}
  validates :fin,
    presence: {message: ' du congé obligatoire'}
  validates :nb_jours,
    presence: {message: ' Obligatoire'},
    numericality: {greater_than: 0,message: ' doit etre supérieur à zéro'},
    numericality: {less_than_or_equal: :diff_fin_debut, message: " doit être inférieur à %{count}"} if :fin_et_debut_valide

  def diff_fin_debut
    (fin - debut).ceil
  end

  def fin_et_debut_valide
    fin && debut && fin > debut
  end

  def nom_type_conges
    Demande.type_conges[type_conges]
  end

  def refuser (motif_refus)
    update acceptee: true,motif_refus: motif_refus
  end

  def valider
    update acceptee: true
  end
end
