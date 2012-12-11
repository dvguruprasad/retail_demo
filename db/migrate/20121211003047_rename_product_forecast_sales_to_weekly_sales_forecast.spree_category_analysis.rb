# This migration comes from spree_category_analysis (originally 20121210163351)
class RenameProductForecastSalesToWeeklySalesForecast < ActiveRecord::Migration
    def change
        rename_table :spree_product_weekly_sales_forecasts, :spree_weekly_sales_forecasts
    end
end
