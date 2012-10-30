# This migration comes from spree_analytics (originally 20121029120316)
class AddTypeToSubstitutionCounts < ActiveRecord::Migration
  def change
      add_column :spree_substitution_counts, :type, :string
  end
end
