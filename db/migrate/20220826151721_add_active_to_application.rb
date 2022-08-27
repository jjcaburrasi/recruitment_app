class AddActiveToApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :active, :boolean, default: true
  end
end
