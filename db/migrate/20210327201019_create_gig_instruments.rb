class CreateGigInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_instruments do |t|
      t.belongs_to :gigs
      t.belongs_to :instruments

      t.timestamps
    end
  end
end
