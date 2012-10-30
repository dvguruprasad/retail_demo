# This migration comes from spree_analytics (originally 20121029120341)
class AddTypeToSubstitutionIdentificationTimestamp < ActiveRecord::Migration
  def change
      add_column :substitution_identification_timestamp, :type, :string
  end
end
