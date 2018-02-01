class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.string :title
      t.text :description
      t.string :contribution_type
      t.integer :user_id

      t.timestamps
    end
  end
end
