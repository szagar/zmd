logname = ::Rails.root.to_s + '/log/' + File.basename(File.dirname(__FILE__))+'_'+File.basename(__FILE__, ".rake")+'.log'
@@logger ||= Logger.new(logname)

namespace :db do
  desc "(SMZ) db:load"
  task :load => :environment do
  end
  
  namespace :load do
    desc "(SMZ) Load:all"
    task :all => :environment do
      # ....
    end
    desc "(SMZ) Load:exchanges"
    task :exch => :environment do
      @@logger.info "check files in: #{File.join(::Rails.root.to_s, 'db/load/exchanges', '*.rb')}"
      fixture = File.join(::Rails.root.to_s, 'db/load/scripts/', 'load_exchanges.rb')
      @@logger.info "Loading #{fixture}"
      require fixture 
      @@logger.info "Loaded #{fixture}"
    end    
    desc "(SMZ) Load:assets"
    task :assets => :environment do
      @@logger.info "check files in: #{File.join(::Rails.root.to_s, 'db/load/assets', '*.rb')}"
      fixture = File.join(::Rails.root.to_s, 'db/load/scripts/', 'load_assets.rb')
      @@logger.info "Loading #{fixture}"
      require fixture 
      @@logger.info "Loaded #{fixture}"
    end    
    desc "(SMZ) Load:prices"
    task :prices => :environment do
      fixture = File.join(::Rails.root.to_s, 'db/load/scripts/', 'load_prices.rb')
      @@logger.info "Loading #{fixture}"
      require fixture 
      @@logger.info "Loaded #{fixture}"
    end    

  end  # load  
end  # db