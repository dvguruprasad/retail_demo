task :clean_orders => :environment do
    sql = File.open("#{File.expand_path(File.dirname(__FILE__))}/scripts/clean_order_data.sql").read
    sql.split(/[\r?\n]/).each do |sql_statement|
        ActiveRecord::Base.connection.execute(sql_statement) unless sql_statement.empty?
    end
end
