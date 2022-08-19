class CreateStages < ActiveRecord::Migration[6.1]
  def change
    create_table :stages do |t|
      t.string :name
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
    add_index :stages, [:job_id, :created_at]
  end
end
