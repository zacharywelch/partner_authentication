require 'rails/generators/active_record'

module PartnerAuthentication
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      argument :name, type: :string, default: 'random_name'
      source_root File.expand_path("../templates", __FILE__)

      def generate_migrations        
        migration_template "api_key_migration.rb", "db/migrate/create_partners.rb"
        migration_template "authorized_ip_migration.rb", "db/migrate/create_ip_addresses.rb"
      end
    end
  end
end
