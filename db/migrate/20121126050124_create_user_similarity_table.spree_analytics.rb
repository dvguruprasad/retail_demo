# This migration comes from spree_analytics (originally 20121126045134)
class CreateUserSimilarityTable < ActiveRecord::Migration
  def change
    create_table :spree_user_similarity_scores ,:force => true do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.float :score
      t.timestamps
    end
  end
end

