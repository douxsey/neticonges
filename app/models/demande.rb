class Demande < ApplicationRecord
  belongs_to :utilisateur
  validates :debut,
    presence: {message: 'Début du congé obligatoire'}
  validates :fin,
    presence: {message: 'Fin du congé obligatoire'}
end
