require 'money'
require 'eu_central_bank'

module ExchangeRate
  class Engine < Rails::Engine
    isolate_namespace ExchangeRate

    # config.to_prepare do
    #   Dir.glob(Rails.root.join('app', 'decorators', '**', '*_decorator*.rb')).each do |c|
    #     puts c
    #     require_dependency(c)
    #   end
    # end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end