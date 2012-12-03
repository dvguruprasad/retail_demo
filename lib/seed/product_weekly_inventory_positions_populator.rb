require 'csv'

class ProductWeeklyInventoryPositionsPopulator
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def populate
    ProductWeeklyInventoryPosition.destroy_all
    CSV.foreach(@csv_file) do |line|
      record = ProductWeeklyInventoryPosition.new
      record.product_id = line[0].to_i
      record.week_start_date = Date.parse(line[1])
      record.week_end_date = Date.parse(line[2])
      record.closing_position = line[3].to_i
      record.save!
    end
  end
end

