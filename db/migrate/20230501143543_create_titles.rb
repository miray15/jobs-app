class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.string :job_description
      t.string :company_name
      t.string :date_applied
      t.string :followed_up
      t.string :interview
      t.integer :salary
      t.string :remote

      t.timestamps
    end
  end
end
