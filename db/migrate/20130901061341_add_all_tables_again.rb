class AddAllTablesAgain < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false
      t.timestamps
    end

    create_table :users do |t|
      t.string :content
      t.integer :user_id
      t.timestamps
    end

    create_table :relationships do |t|
        t.integer :follower_id
        t.integer :followed_id
        t.timestamps
    end


    create_table :locations do |t|
        t.string :address
        t.float :latitude
        t.float :longitude
        t.timestamps
    end

        create_table :eventos do |t|
          t.string :nombre
          t.string :descripcion
          t.datetime :fecha
          t.string :photo
          t.string :urloficial
          t.string :artista
          t.string :entradatipo
          t.string :precio
          t.string :votos
          t.string :ranking
          t.string :photo_file_name
          t.string :photo_content_type
          t.integer :photo_file_size
          t.string :slug
          t.datetime :photo_updated_at


          t.timestamps
        end


      add_index :eventos, :slug
      add_index :microposts, [:user_id, :created_at]
      add_index :users, [:remember_token]
      add_index :relationships, :follower_id
      add_index :relationships, :followed_id
      add_index :relationships, [:follower_id, :followed_id], unique: true
    end

end
