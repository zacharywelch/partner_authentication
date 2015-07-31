require 'rails/generators/base'

module PartnerAuthentication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def generate_migration
        generate "migration", "create_partners partner_id partner_password --skip"
        generate "migration", "create_ip_addresses partner_id ip_address --skip"
        rake "db:migrate"
      end

      def copy_models
        %w(api_key authorized_ip).each do |model|
          copy_file "#{model}.rb", "app/models/#{model}.rb"
        end
      end      
    end
  end
end
