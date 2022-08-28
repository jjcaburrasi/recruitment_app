class AddStatusToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :status, :string, default: "created"; 
    remove_column :jobs, :published
  end
end
