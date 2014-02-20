class UpdateEntriesTables < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.belongs_to :user
    end

    remove_column :entries, :users_id
  end
end
