class AddStageToApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :stage, :integer, null: false, default: 1
  end
end
