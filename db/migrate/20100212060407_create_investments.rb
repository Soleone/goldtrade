class CreateInvestments < ActiveRecord::Migration
  def self.up
    create_table :investments do |t|
      t.string :name
      t.integer :amount, :default => 1
      
      t.timestamps      
    end
  end

  def self.down
    drop_table :investments
  end
end
