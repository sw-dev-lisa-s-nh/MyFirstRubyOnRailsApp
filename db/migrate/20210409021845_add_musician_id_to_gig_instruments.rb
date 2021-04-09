class AddMusicianIdToGigInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :gig_instruments, :musician_id, :integer
  end
end
