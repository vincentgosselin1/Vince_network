class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :friend_id
      t.integer :friends_with_id

      t.timestamps null: false
    end
    add_index :relationships, :friend_id
    add_index :relationships, :friends_with_id
    add_index :relationships, [:friend_id, :friends_with_id], unique: true
  end
end
