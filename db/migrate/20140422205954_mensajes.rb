class Mensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.integer :sender
      t.integer :receiver
      t.integer :long
      t.integer :lat
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.string   "photo_file_size"
      t.datetime "photo_updated_at"
      t.string   "slug"
      t.text     "mapa"


      t.timestamps
    end
  end
end
