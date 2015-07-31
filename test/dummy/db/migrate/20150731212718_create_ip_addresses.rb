class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.string :partner_id
      t.string :ip_address
    end
  end
end
