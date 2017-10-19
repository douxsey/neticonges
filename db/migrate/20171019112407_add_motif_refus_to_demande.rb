class AddMotifRefusToDemande < ActiveRecord::Migration[5.1]
  def change
	  add_column :demandes, :motif_refus, :string
  end
end
