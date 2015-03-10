class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :keyword, null: false, index: true

      t.timestamps null: false
    end
  end
end
