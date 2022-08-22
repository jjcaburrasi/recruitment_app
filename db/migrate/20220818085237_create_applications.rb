class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end

    add_index :applications, :user_id
    add_index :applications, :job_id
    add_index :applications, [:user_id, :job_id], unique: true
  end
end
