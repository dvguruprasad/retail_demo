require 'csv'

class ProductWeeklySalesPopulator
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def populate
    Spree::Admin::ProductWeeklySales.destroy_all
    CSV.foreach(@csv_file) do |line|
      record = Spree::Admin::ProductWeeklySales.new
      record.product_id = line[0].to_i
      record.week_start_date = Date.parse(line[1])
      record.week_end_date = Date.parse(line[2])
      record.sales_units = line[3].to_i
      record.revenue = line[4].to_f
      record.cost = line[5].to_f
      record.target_sales_units = line[6].to_i
      record.target_revenue = line[7].to_i
      record.save!
    end
  end
end
