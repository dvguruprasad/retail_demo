# This migration comes from spree_analytics (originally 20121122111846)
class ChangeTypeOfUserIdInUserBehaviors < ActiveRecord::Migration
    def change
        change_column :spree_user_behaviors, :user_id ,:integer
    end
end
