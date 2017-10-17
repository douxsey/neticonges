module ApplicationHelper
  def list_type_conges
    Demande.type_conges.values
  end
end
