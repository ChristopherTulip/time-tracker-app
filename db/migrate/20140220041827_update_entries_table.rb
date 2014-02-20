class UpdateEntriesTable < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.belongs_to :users
    end
  end
end
