require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
# Carrega o arquivo onde passamos a url e header da requisição
require_relative '../services/login_service.rb'
require_relative '../services/cadastrar_service.rb'

RSpec.configure do |config|
  # incluimos o modulo criado no arquivo login_service.rb
  include Login
  include Cadastrar
  # setamos a configuração para a documentação
  config.color = true
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
