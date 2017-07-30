class CreateChallengeTags < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge_tags do |t|
      t.integer :tag_id, null: false
      t.integer :challenge_id, null: false
      t.timestamps
    end
  end
end
