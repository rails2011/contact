class AddBdateToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :bdate, :date
  end

  def self.down
    remove_column :addresses, :bdate
  end
end
