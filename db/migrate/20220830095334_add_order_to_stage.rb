class AddOrderToStage < ActiveRecord::Migration[6.1]
  def change
    add_column :stages, :order, :integer
  end
end
