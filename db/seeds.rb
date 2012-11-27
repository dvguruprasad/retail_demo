require 'seed/wine_type_similarity_scores_populator'
require 'seed/wine_varietal_similarity_scores_populator'
require 'seed/taxon_configuration_populator'

TaxonConfiguration.destroy_all
TaxonConfigurationPopulator.populate

Recommendation::WineTypeSimilarityScore.destroy_all
WineTypeSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/wine_type_similarity_scores.csv').populate

Recommendation::WineVarietalSimilarityScore.destroy_all
WineVarietalSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/wine_varietal.csv').populate
