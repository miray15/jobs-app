class AddTitleToTable < ActiveRecord::Migration[7.0]
  def change
  add_column :titles, :title, :string
  
  end
end


