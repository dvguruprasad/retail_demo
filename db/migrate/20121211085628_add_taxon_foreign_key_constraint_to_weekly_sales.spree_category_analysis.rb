# This migration comes from spree_category_analysis (originally 20121206051021)
class AddTaxonForeignKeyConstraintToWeeklySales < ActiveRecord::Migration
    def change
        execute <<-SQL
      ALTER TABLE spree_weekly_sales
        ADD CONSTRAINT fk_taxon_constraint
        FOREIGN KEY (parent_id)
        REFERENCES spree_taxons(id)
        SQL
    end
end
