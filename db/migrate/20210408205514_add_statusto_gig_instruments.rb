class AddStatustoGigInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :gig_instruments, :gig_instrument_status, :integer
  end
end
