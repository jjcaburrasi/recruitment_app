class AddStatusToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :status, :string, default: "created";
    remove_column :offers, :accepted
  end
end
