namespace :devlifecycles do
  desc "Synchronizes models with Devlifecycles"
  task :sync => :environment do
    puts "Using API KEY: #{Devlifecycles.api_key}"
    model_name = ARGV.last.camelize
    model_class = Object
    begin
      model_class = model_name.constantize
      if model_class.superclass != ActiveRecord::Base
        raise "#{model_name} is not an instance of ActiveRecord::Base -- cannot sync."
      end

      if !model_class.method_defined? :sync_with_devlifecycles
        raise "#{model_name} cannot be synchronized -- did you forget to add uses_devlifecycles to your model definition?"
      end
      puts "Syncing #{model_class} (#{model_class.count} instances)"
      model_class.all.each do |m|
        puts m.sync_with_devlifecycles
      end
    rescue => e
      puts e
    end
  end
end
