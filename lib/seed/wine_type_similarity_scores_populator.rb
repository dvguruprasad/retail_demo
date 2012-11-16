class WineTypeSimilarityScoresPopulator
  def initialize(similarity_scores_csv_file)
    @similarity_scores_csv_file = similarity_scores_csv_file
  end

  def populate
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
