# This migration comes from spree_analytics (originally 20121126091643)
class CreateCfRecommendations < ActiveRecord::Migration
    def change
        create_table :spree_cf_recommendations ,:force => true do |t|
            t.integer :user_id
            t.string :product_ids , :limit => 1000
            t.timestamps
        end
    end
end
