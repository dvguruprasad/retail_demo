require "#{File.expand_path(File.dirname(__FILE__))}/transactions_generator"

task :create_transactions => :environment do
  TransactionsGenerator.new.generate
end
