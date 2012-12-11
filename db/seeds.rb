require 'seed/wine_type_similarity_scores_populator'
require 'seed/wine_varietal_similarity_scores_populator'
require 'seed/taxon_configuration_populator'
require 'seed/weekly_sales_populator'
require 'seed/weekly_sales_forecasts_populator'
require 'seed/product_weekly_inventory_positions_populator'
require 'seed/inventory_replenishments_populator'

TaxonConfiguration.destroy_all
TaxonConfigurationPopulator.populate

Recommendation::WineTypeSimilarityScore.destroy_all
WineTypeSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/wine_type_similarity_scores.csv').populate

Recommendation::WineVarietalSimilarityScore.destroy_all
WineVarietalSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/wine_varietal.csv').populate

WeeklySalesPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/weekly_sales.csv').populate
WeeklySalesForecastsPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/forecasted_sales.csv').populate

ProductWeeklyInventoryPositionsPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/product_weekly_inventory_positions.csv').populate
InventoryReplenishmentsPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/inventory_replenishments.csv').populate
