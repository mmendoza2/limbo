class AddLatandLeng < ActiveRecord::Migration
  def change
    add_column :users, :lat, :integer
    add_column :users, :lng, :integer
  end
end
