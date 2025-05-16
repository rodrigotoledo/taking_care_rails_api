# Guardfile para RSpec com configurações avançadas

guard 'rspec', cmd: 'bundle exec rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # Ignore certos diretórios/padrões
  ignore %r{^spec/(fixtures|support)/}
  ignore %r{^spec/features/} # Se você tiver specs de features separadas

  # Configurações do RSpec
  rspec_opts = {
    cmd: 'bundle exec rspec',
    failed_mode: :focus,    # Executa apenas falhas na próxima rodada
    change_format: :documentation, # Formato de saída quando há mudanças
    all_format: :progress,  # Formato de saída quando executando tudo
    all_on_start: false,    # Não executa todos os testes no início
    keep_failed: true,      # Mantém os falhos na lista para reexecução
    run_all: { cmd: 'bundle exec rspec' } # Comando para executar todos os testes
  }

  # Watch padrão para specs
  watch(dsl.rspec.spec_helper) { 'spec' }
  watch(dsl.rspec.spec_support) { 'spec' }
  watch(dsl.rspec.spec_files)

  # Watch para arquivos Ruby
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})

  # Watch para views (se aplicável)
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$}) { |m| "spec/views/#{m[1]}" }

  # Watch para controllers
  watch(%r{^app/controllers/(.+)\.rb$}) { |m| "spec/controllers/#{m[1]}_spec.rb" }

  # Watch para models
  watch(%r{^app/models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }

  # Watch para jobs (se usar Active Job)
  watch(%r{^app/jobs/(.+)\.rb$}) { |m| "spec/jobs/#{m[1]}_spec.rb" }

  # Watch para mailers
  watch(%r{^app/mailers/(.+)\.rb$}) { |m| "spec/mailers/#{m[1]}_spec.rb" }

  # Watch para helpers
  watch(%r{^app/helpers/(.+)\.rb$}) { |m| "spec/helpers/#{m[1]}_spec.rb" }

  # Watch para config (se tiver specs para configurações)
  watch(%r{^config/(.+)\.rb$}) { |m| "spec/config/#{m[1]}_spec.rb" }

  # Watch para factories (se usar FactoryBot)
  watch(%r{^spec/factories/(.+)\.rb$}) { "spec" }

  # Watch para arquivos de rotas
  watch(%r{^config/routes\.rb$}) { "spec/routing" }
  watch(%r{^config/routes\.rb$}) { "spec/requests/api" } # Se tiver rotas de API separadas
end
