# This migration comes from spree_category_analysis (originally 20121204095550)
class CreateWeeklySales < ActiveRecord::Migration
    create_table :spree_weekly_sales do |table|
        table.integer :child_id
        table.integer :parent_id
        table.date :week_start_date
        table.date :week_end_date
        table.integer :sales_units
        table.float :revenue
        table.integer :target_sales_units
        table.float :target_revenue
        table.float :cost
        table.timestamps

    end
end
