# This migration comes from spree_analytics (originally 20121017084613)
class CreateSubstitutionCount < ActiveRecord::Migration
  def change
      create_table :spree_substitution_count do |t|
          t.integer :searched_product
          t.integer :bought_product
          t.integer :count
          t.timestamps
      end
  end
end
