class CreateWillApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :will_applies do |t|
      t.string :title
      t.string :job_description
      t.string :company_name
      t.string :date_applied
      t.integer :salary
      t.string :remote

      t.timestamps
    end
  end
end
