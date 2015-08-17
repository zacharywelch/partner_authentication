class CreatePartners < ActiveRecord::Migration
  def change
    create_table "ardata.cbpartner", primary_key: :RowID do |t|
      t.string :PartnerID
      t.string :PartnerPassword
    end
  end
end
