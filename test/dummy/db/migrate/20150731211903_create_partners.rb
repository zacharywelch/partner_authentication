class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partner_id
      t.string :partner_password
    end
  end
end
