class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :nonprofit_id
      t.integer :plan_id
      t.string :token
    end
  end
end
