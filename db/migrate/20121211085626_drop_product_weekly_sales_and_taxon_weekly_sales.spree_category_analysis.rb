# This migration comes from spree_category_analysis (originally 20121204094146)
class DropProductWeeklySalesAndTaxonWeeklySales < ActiveRecord::Migration
    def change
        drop_table :spree_product_weekly_sales
        drop_table :spree_taxon_weekly_sales
    end
end
