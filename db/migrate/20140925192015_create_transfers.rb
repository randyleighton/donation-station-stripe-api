class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.belongs_to :nonprofit, index: true
    end
  end
end
