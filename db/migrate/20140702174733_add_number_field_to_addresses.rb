class AddNumberFieldToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :number, :string
    add_column :addresses, :zipcode, :string
  end
end
