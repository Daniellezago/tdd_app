# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
# Uncomment the line below in case you have `--require rails_helper` in the `.rspec` file
# that will avoid rails generators crashing because migrations haven't been run yet
# return unless Rails.env.test?
require 'rspec/rails'

# Carrega todos os arquivos de spec/support (necessário para registrar o driver :headless_edge)
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f } # <- ADICIONADO


# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

# Configuração de i18n
I18n.locale = 'pt-BR'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!

  # Configuração dos Testes de Sistema (System Specs)
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # Mudança aqui: Trocado de :headless_chrome para :headless_edge
  config.before(:each, type: :system, js: true) do
  driven_by :selenium_chrome_headless
  end
end