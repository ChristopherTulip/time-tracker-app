class AddSecurePasswordToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :access_token
      t.string :password
      t.string :secure_password
    end
  end
end
