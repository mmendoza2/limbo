class AddColumntoMicrositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :reference, :text
  end
end
