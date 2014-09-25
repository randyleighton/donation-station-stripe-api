class AddEmailAndTokenColumnsToNonprofitsTable < ActiveRecord::Migration
  def change
    add_column :nonprofits, :email, :string
    add_column :nonprofits, :token, :string
  end
end
