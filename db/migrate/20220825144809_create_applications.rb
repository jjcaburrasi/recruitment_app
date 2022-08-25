class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :job, null: false, foreign_key: true
      t.belongs_to :stage, null: false, foreign_key: true

      t.timestamps
    end

    # add_index :applications, :user_id
    # add_index :applications, :job_id
    # add_index :applications, [:user_id, :job_id], unique: true
  end
end
