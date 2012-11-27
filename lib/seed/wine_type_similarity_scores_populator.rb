class WineTypeSimilarityScoresPopulator
  def initialize(similarity_scores_csv_file)
    @similarity_scores_csv_file = similarity_scores_csv_file
  end

  def populate
    wine_taxon = Spree::Taxon.find_by_name('Wines')
    if wine_taxon.nil?
      raise "No taxon named Wines!! Seed abort!!"
    end 
    wine_config = TaxonConfiguration.find_by_taxon_id_and_recommendation_type(wine_taxon.id, 'rec')
    if wine_config.nil?
      TaxonConfiguration.create(:taxon_id =>wine_taxon.id, :recommendation_type => 'rec')
    end
    lines = IO.read(@similarity_scores_csv_file, :encoding => "UTF-8").split("\n")
    lines.each do |line|
      data = line.split(",")
      score = Recommendation::WineTypeSimilarityScore.new
      score.wine_type_1 = data[0]
      score.wine_type_2 = data[1]
      score.similarity_score = data[2]
      score.save
    end
  end
end
