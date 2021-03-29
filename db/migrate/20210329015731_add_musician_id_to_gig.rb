class AddMusicianIdToGig < ActiveRecord::Migration[6.1]
  def change
    add_column :gigs, :musician_id, :integer
  end
end
