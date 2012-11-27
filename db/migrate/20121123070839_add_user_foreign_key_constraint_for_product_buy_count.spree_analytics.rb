# This migration comes from spree_analytics (originally 20121123064120)
class AddUserForeignKeyConstraintForProductBuyCount < ActiveRecord::Migration
    def change
        execute <<-SQL
      ALTER TABLE spree_product_buy_counts
        ADD CONSTRAINT fk_user_constraint
        FOREIGN KEY (user_id)
        REFERENCES spree_users(id)
        SQL
    end
end
