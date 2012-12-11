require 'csv'

class WeeklySalesForecastsPopulator
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def populate
    Spree::Admin::WeeklySalesForecast.destroy_all
    CSV.foreach(@csv_file) do |line|
      record = Spree::Admin::WeeklySalesForecast.new
      record.parent_id = line[0].to_i
      record.child_id = line[1].to_i
      record.week_start_date = Date.strptime(line[2],'%d/%m/%y')
      record.week_end_date = Date.strptime(line[3],'%d/%m/%y')
      record.sales_units = line[4].to_i
      record.revenue = line[5].to_f
      record.cost = line[6].to_f
      record.target_sales_units = line[7].to_i
      record.target_revenue = line[8].to_i
      record.save!
    end
  end
end
