require 'csv'
require 'logger'

logname = ::Rails.root.to_s + '/log/' + File.basename(File.dirname(__FILE__))+'_'+File.basename(__FILE__, ".rb")+'.log'
puts "logname=#{logname}"
ActiveRecord::Base.logger = Logger.new(logname)
logger = Logger.new(logname)
logger.datetime_format = '%Y-%m-%d %H:%M:%S'
logger.level = Logger::INFO   #  DEBUG INFO WARN ERROR FATAL

atypes = Hash.new
AssetType.find(:all).each { |t| atypes[t.short_name] = t.id }
dflt_atype = { 'NYSE' => 'STOCK', 'AMEX' => 'STOCK', 'NASDAQ' => 'STOCK', 'OPRA' => 'EQOPT'}

#Symbol	Name
#A	Agilent Technologies Inc.
#AA	Alcoa Inc.
#AAI	Airtran Holdings Inc.
#AAN	Aaron's Inc.

Asset.delete_all
Dir[File.join(::Rails.root.to_s, 'db/load/data/assets', '*.txt')].sort.each do |csvfile| 
  logger.info "Loading csv file (#{csvfile})"
  puts "Loading csv file (#{csvfile})"
  exchange = File.basename(csvfile,".txt")
  puts "exchange (#{exchange})"
  ati = atypes[dflt_atype[exchange]]
  puts "exchange ====#{exchange}==="
  puts "dflt_atype ====#{dflt_atype[exchange]}==="
  puts "atype ====#{atypes[dflt_atype[exchange]]}==="
  CSV.open(csvfile,'r', {:headers => :first_row, :col_sep => "\t" }).each do |row|
    Asset.create(:exchange_code => exchange, :symbol => row[0], :desc => row[1], 
                 :asset_type_id => ati)
  end
  puts "#{csvfile} loaded !!"
  @@logger.info "#{csvfile} loaded !!"
end
