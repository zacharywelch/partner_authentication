class ApiKey < ActiveRecord::Base
  self.table_name = "ardata.cbpartner"
  self.primary_key = "RowID"

  alias_attribute :key, :PartnerID
  alias_attribute :token, :PartnerPassword

  has_many :authorized_ips, primary_key: :PartnerID, foreign_key: :PartnerID

  def authorized?(ip)
    Rails.cache.fetch("#{cache_key}/ips", expires_in: 12.hours) do
      authorized_ips.to_a
    end.map(&:pattern).any? { |pattern| pattern.match(ip) }
  end

  def self.authenticate(key, token)
    Rails.cache.fetch("#{key}/#{token}", expires_in: 12.hours) do
      find_by(key: key, token: token)
    end
  end
end