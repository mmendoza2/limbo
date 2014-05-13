class AddcolumntMicrossitios < ActiveRecord::Migration
  def change
    add_column :micrositios, :lat, :text
    add_column :micrositios, :lng, :text
  end
end
