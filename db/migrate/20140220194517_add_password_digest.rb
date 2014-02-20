class AddPasswordDigest < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password_digest
    end

    remove_column :users, :secure_password
  end
end
