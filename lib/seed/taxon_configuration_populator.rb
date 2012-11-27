class TaxonConfigurationPopulator
    def self.populate
        create_by_taxon_name('Clothing and Accessories','sub')
        create_by_taxon_name('Deodorants','sub')
        create_by_taxon_name('Wines','rec')
    end

    private
    def self.create_by_taxon_name(name, type)
        taxon = Spree::Taxon.find_by_name(name)
        if taxon.nil?
            raise "No taxon named #{name}!! Seed abort!!"
        end
        taxon_config = TaxonConfiguration.find_by_taxon_id_and_recommendation_type(taxon.id, type)
        if taxon_config.nil?
            TaxonConfiguration.create(:taxon_id =>taxon.id, :recommendation_type => type)
        end
    end
end
