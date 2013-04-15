namespace :devlifecycles do
  desc "Synchronizes models with Devlifecycles"
  task :sync => :environment do
    puts "Using API KEY: #{Devlifecycles.api_key}"
  end
end
