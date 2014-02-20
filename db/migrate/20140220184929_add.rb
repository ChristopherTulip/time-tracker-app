class Add < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email, null: false, default: ""
    end
  end
end
