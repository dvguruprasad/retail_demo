# This migration comes from spree_category_analysis (originally 20121130104026)
class AddTaxonIdToProductWeeklySales < ActiveRecord::Migration
  def change
      add_column :spree_product_weekly_sales, :taxon_id, :integer
  end
end
