require 'csv'
require 'logger'

logname = ::Rails.root.to_s + '/log/' + File.basename(File.dirname(__FILE__))+'_'+File.basename(__FILE__, ".rb")+'.log'
puts "logname=#{logname}"
ActiveRecord::Base.logger = Logger.new(logname)
logger = Logger.new(logname)
logger.datetime_format = '%Y-%m-%d %H:%M:%S'
logger.level = Logger::INFO   #  DEBUG INFO WARN ERROR FATAL

#A,20110121,42.5,43.26,42.03,42.11,3004500
#AA,20110121,16.07,16.2,15.77,15.79,27956800
#AAI,20110121,7.48,7.52,7.46,7.48,2552300
#AAN,20110121,20.81,20.85,20.04,20.13,422900
#AAP,20110121,63.56,63.94,62.52,63.51,756700
#=>    symbol,date,open,high,low,close,volume[,openinterest]

Dir[File.join(::Rails.root.to_s, 'db/load/data/eod_marks', '*.txt')].sort.each do |csvfile| 
  logger.info "Loading csv file (#{csvfile})"
  puts "Loading csv file (#{csvfile})"
#  exchange = File.basename(csvfile,".txt")
#  puts "exchange ====#{exchange}==="
  exchange = File.basename(csvfile,"_*")
  puts "exchange ====#{exchange}==="
  assets = Hash.new
  Asset.find_all_by_exchange_code(exchange).each { |a| assets["#{a.exchange_code}:#{a.symbol}"] = a.id }
  CSV.open(csvfile,'r', {:col_sep => "\t" }).each do |row|
    EodPrice.create(:asset_id => assets["#{exchange}:#{row[0]}"], :mark_date => row[1],
                    :open_px => row[2], :high_px => row[3], :low_px => row[4], 
                    :close_px => row[5], :volume => row[6], :open_interest[7] => row[7])
  end
  puts "#{csvfile} loaded !!"
  @@logger.info "#{csvfile} loaded !!"
end
