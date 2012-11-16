require 'seed/wine_type_similarity_scores_populator'

Recommendation::WineTypeSimilarityScore.destroy_all
WineTypeSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../lib/tasks/data/wine_type_similarity_scores.csv').populate
