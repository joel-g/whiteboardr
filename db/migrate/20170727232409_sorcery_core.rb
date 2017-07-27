class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    drop_table :users
    
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :username, null: false
      t.string :name, null: false

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
