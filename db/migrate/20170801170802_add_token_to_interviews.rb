class AddTokenToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :token, :string
  end
end
