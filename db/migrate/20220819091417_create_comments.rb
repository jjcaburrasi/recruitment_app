class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :job_id
    add_index :comments, [:user_id, :job_id]
  end
end
