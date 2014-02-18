class CreateFirstTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end

    create_table :entries do |t|
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
