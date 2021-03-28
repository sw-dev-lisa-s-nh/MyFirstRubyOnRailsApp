class CreateUserInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_instruments do |t|
      t.belongs_to :users
      t.belongs_to :instruments

      t.timestamps
    end
  end
end
