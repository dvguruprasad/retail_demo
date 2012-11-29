START TRANSACTION;
DELETE FROM spree_orders WHERE user_id not in (SELECT id FROM spree_users);
COMMIT;

