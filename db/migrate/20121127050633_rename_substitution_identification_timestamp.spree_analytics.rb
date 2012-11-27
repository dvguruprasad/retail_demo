# This migration comes from spree_analytics (originally 20121127045813)
class RenameSubstitutionIdentificationTimestamp < ActiveRecord::Migration
    def change
        rename_table :substitution_identification_timestamp, :recommendation_identification_timestamps
    end
end
