# This migration comes from spree_analytics (originally 20121106113151)
class CreateTaxonConfiguration < ActiveRecord::Migration
    def change
        create_table "spree_taxon_configurations" do |t|
            t.integer :taxon_id
            t.string :recommendation_type
        end
        execute <<-SQL
      ALTER TABLE spree_taxon_configurations ADD CONSTRAINT fk_taxon FOREIGN KEY (taxon_id) REFERENCES spree_taxons(id)
        SQL
    end
end
