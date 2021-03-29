class AddstatustoGig < ActiveRecord::Migration[6.1]
  def change
    add_column :gigs, :gig_status, :status
  end
end
