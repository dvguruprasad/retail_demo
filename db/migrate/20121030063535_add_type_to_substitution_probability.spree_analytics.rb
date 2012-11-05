# This migration comes from spree_analytics (originally 20121030063222)
class AddTypeToSubstitutionProbability < ActiveRecord::Migration
  def change
      add_column :spree_substitution_probabilities, :type, :string
  end
end
