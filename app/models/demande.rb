class Demande < ApplicationRecord
  belongs_to :utilisateur
  enum type_conges: {conge_paye: 'Congés payés',conge_maladie: 'Congés maladie',conge_non_paye: 'Congés non payés'}
  validates :debut,
    presence: {message: ' du congé obligatoire'}
  validates :fin,
    presence: {message: ' du congé obligatoire'}
  validates :nb_jours,
    presence: {message: ' Obligatoire'},
    numericality: {greater_than: 0,message: ' doit etre supérieur à zéro'},
    numericality: {less_than: :diff_fin_debut, message: " doit être inférieur à %{count}"} if :fin_et_debut_valide

  def diff_fin_debut
    (fin - debut).ceil
  end
  def fin_et_debut_valide
    fin && debut && fin > debut
  end
end
