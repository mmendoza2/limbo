class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :editor_estado, :string
  end
end
