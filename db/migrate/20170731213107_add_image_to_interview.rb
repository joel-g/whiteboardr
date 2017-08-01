class AddImageToInterview < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :image_uid, :string
    add_column :interviews, :image_name, :string
  end
end
