require 'csv'

class InventoryReplenishmentsPopulator
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def populate
    Spree::Admin::InventoryReplenishment.destroy_all
    CSV.foreach(@csv_file) do |line|
      record = Spree::Admin::InventoryReplenishment.new
      record.product_id = line[0].to_i
      record.replenishment_date = Date.parse(line[1])
      record.quantity = line[2].to_i
      record.save!
    end
  end
end
