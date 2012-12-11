# This migration comes from spree_category_analysis (originally 20121211003927)
class AddParentIdAndRelationToSpreeWeeklySalesForecasts < ActiveRecord::Migration
    def change
        rename_column :spree_weekly_sales_forecasts, :product_id, :child_id
        add_column :spree_weekly_sales_forecasts, :parent_id, :integer
        execute <<-SQL
      ALTER TABLE spree_weekly_sales_forecasts
        ADD CONSTRAINT fk_taxon_forecast_constraint
        FOREIGN KEY (parent_id)
        REFERENCES spree_taxons(id)
        SQL
    end
end
