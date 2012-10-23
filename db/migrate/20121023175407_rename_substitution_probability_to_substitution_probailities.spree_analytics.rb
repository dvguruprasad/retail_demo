# This migration comes from spree_analytics (originally 20121023122301)
class RenameSubstitutionProbabilityToSubstitutionProbailities < ActiveRecord::Migration
  def change
   rename_table :spree_substitution_probability, :spree_substitution_probabilities 
  end
end
