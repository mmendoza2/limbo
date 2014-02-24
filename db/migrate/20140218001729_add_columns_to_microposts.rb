class AddColumnsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :coordenadas, :text
    add_column :microposts, :receiver_id, :integer
  end
end
