class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title, null: false
      t.string :input
      t.string :output
      t.string :body, null: false
      t.string :solution
      t.string :difficulty
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
