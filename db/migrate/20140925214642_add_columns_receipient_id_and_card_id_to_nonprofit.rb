class AddColumnsReceipientIdAndCardIdToNonprofit < ActiveRecord::Migration
  def change
    add_column :nonprofits, :recipient_token, :string
    add_column :nonprofits, :card_token, :string
  end
end
