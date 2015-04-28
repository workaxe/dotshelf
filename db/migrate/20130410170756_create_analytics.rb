class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :report
      t.string :report_type
      t.integer :user_id

      t.timestamps
    end
  end
end
