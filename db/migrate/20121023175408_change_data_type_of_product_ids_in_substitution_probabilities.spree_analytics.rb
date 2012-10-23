# This migration comes from spree_analytics (originally 20121023123352)
class ChangeDataTypeOfProductIdsInSubstitutionProbabilities < ActiveRecord::Migration
  def change
      change_column :spree_substitution_probabilities, :searched_product ,:integer
      change_column :spree_substitution_probabilities, :bought_product ,:integer
  end
end
