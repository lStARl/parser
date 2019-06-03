parser = Sidekiq::Cron::Job.find "Parser"

if parser
  parser.enable! if parser.status == 'disabled'
else
  Sidekiq::Cron::Job.create(name: 'Parser', cron: '*/10 * * * *', class: 'CheckGemsJob')
end
