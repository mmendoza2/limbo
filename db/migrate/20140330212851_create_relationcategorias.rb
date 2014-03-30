class CreateRelationcategorias < ActiveRecord::Migration
  def change
    create_table :relationcategorias do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationcategorias, :follower_id
    add_index :relationcategorias, :followed_id
    add_index :relationcategorias, [:follower_id, :followed_id], unique: true


  end
end
