class Utilisateur < ApplicationRecord
  has_secure_password
  has_many :demandes
  enum role: {
    admin: 'Administrateur',
    user: 'Utilisateur'
  }
  validates :email,
    presence: true,
    uniqueness: true
  def self.authenticate(email, password)
    me = where(email: email).first
    me && me.authenticate(password)
  end
end
