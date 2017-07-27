class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id, null: false
      t.integer :interview_id, null: false
      t.integer :board_rating, null: false
      t.integer :presence_rating, null: false
      t.integer :knowledge_rating, null: false
      t.integer :riot_rating, null: false
      t.string :comments, null: false
      t.timestamps
    end
  end
end
