class AddStatusToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :status, :string, default: "unpublished"; 
  end
end
