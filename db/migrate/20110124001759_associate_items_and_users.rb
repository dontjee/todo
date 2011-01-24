class AssociateItemsAndUsers < ActiveRecord::Migration
  def self.up
    add_column :items, :user_id, :integer
    add_index :items, :user_id
  end

  def self.down
    remove_index :items, :user_id
    remove_column :items, :user_id
  end
end
