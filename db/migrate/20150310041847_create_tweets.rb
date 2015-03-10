class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user, required: true, index: true
      t.string :message, null: false

      t.timestamps null: false
    end
    add_foreign_key :tweets, :users
  end
end
