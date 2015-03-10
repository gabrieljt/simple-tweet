class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.string :password, null: false

      t.timestamps null: false
    end
  end
end
