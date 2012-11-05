# This migration comes from spree_analytics (originally 20121029045932)
class CreateProbabilityThresholdForDiscount < ActiveRecord::Migration
  def change
      Spree::Preference.create(:key => "spree/app_configuration/probability_threshold_for_discounts", :value => 0.5, :value_type => "decimal")
  end
end
