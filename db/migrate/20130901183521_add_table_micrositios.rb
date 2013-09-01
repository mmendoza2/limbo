class AddTableMicrositios < ActiveRecord::Migration
  def change
    create_table :micrositios, force: true do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :nombre
      t.string   :descripcion
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.string   :photo
      t.string   :slug
      t.string :precio
      t.string :votos
      t.string :ranking
      t.string :urloficial
      t.datetime :fecha
    end
    add_index :micrositios, :slug
  end
end
