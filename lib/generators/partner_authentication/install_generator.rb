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

      def copy_models
        %w(api_key authorized_ip).each do |model|
          copy_file "#{model}.rb", "app/models/#{model}.rb"
        end
      end
    end
  end
end
