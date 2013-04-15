namespace :devlifecycles do
  desc "Synchronizes models with Devlifecycles"
  task :sync => :environment do
    puts "Using API KEY: #{Devlifecycles.api_key}"
    model_name = ARGV.last
    model_class = Object
    begin
      model_class = model_name.camelize.constantize
      if model_class.superclass != ActiveRecord::Base
        raise "#{model_class.superclass}"
      end
      puts "Syncing #{model_class}"
    rescue
      puts "#{model_name} is not an instance of ActiveRecord::Base -- cannot sync."
    end
  end
end
