require 'csv'
require 'logger'

puts "in load_echanges"
logname = ::Rails.root.to_s + '/log/' + File.basename(File.dirname(__FILE__))+'_'+File.basename(__FILE__, ".rb")+'.log'
puts "logname=#{logname}"
ActiveRecord::Base.logger = Logger.new(logname)
logger = Logger.new(logname)
logger.datetime_format = '%Y-%m-%d %H:%M:%S'
logger.level = Logger::INFO   #  DEBUG INFO WARN ERROR FATAL

#Code	Name
#AMEX	American Stock Exchange
#ASX	Australian Stock Exchange
#CBOT	Chicago Board of Trade
#CME	Chicago Merchantile Exchange
#COMEX	New York Commodity Exchange
#FOREX	Foreign Exchange (Interbank)
#HKEX	Hong Kong Stock Exchange
#INDEX	Global Indices

Exchange.delete_all
ex2load = { 'NYSE' => true, 'AMEX' => true, 'NASDAQ' => true}
puts "#{File.join(::Rails.root.to_s, 'db/load/data/exchanges', '*.txt')}"
Dir[File.join(::Rails.root.to_s, 'db/load/data/exchanges', '*.txt')].sort.each do |csvfile| 
  puts "Loading csv file (#{csvfile})"
  logger.info "Loading csv file (#{csvfile})"
  CSV.open(csvfile,'r', {:headers => :first_row, :col_sep => "\t" }).each do |row|
    flag = ex2load[row[0]] || false
    Exchange.create(:code => row[0], :name => row[1], :load_issues => flag)
  end
  puts "#{csvfile} loaded !!"
  @@logger.info "#{csvfile} loaded !!"
end