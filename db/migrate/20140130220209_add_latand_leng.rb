class AddLatandLeng < ActiveRecord::Migration
  def change
    add_column :users, :lat, :text
    add_column :users, :lng, :text
  end
end
