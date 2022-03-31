class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :object_id
      t.string :object_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
