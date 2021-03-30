class AddPlannerIdToGig < ActiveRecord::Migration[6.1]
  def change
    add_column :gigs, :planner_id, :integer
  end
end
