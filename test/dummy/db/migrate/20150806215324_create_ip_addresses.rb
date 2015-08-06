class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :cbpartneripaddress, primary_key: :RowID do |t|
      t.string :PartnerID
      t.string :IPAddress
    end
  end
end
