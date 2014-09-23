class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :nonprofit
      t.float :amount
      t.string :token

      t.timestamps
    end
  end
end
