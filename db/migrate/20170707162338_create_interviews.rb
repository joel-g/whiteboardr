class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :interviewer_id, null: false
      t.integer :applicant_id, null: false
      t.integer :challenge_id, null: false
      t.integer :run_time_minutes
      t.timestamps
    end
  end
end
