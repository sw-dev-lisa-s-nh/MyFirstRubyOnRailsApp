class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :description
      t.string :start_time
      t.string :duration
      t.string :genre
      t.string :date
      t.string :address
      t.string :phone
      t.string :salary
      t.integer :instrument_id
      t.integer :status

      t.timestamps
    end
  end
end
