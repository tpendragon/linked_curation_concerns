# -*- encoding : utf-8 -*-
class SolrDocument 

  include Blacklight::Solr::Document
  # Adds CurationConcerns behaviors to the SolrDocument.
  include CurationConcerns::SolrDocumentBehavior


  # self.unique_key = 'id'
  
  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension( Blacklight::Document::Email )
  
  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension( Blacklight::Document::Sms )

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension( Blacklight::Document::DublinCore)    


  # Do content negotiation for AF models. 

  use_extension( Hydra::ContentNegotiation )


  def [](key)
    property(key).values
  end

  private

  def property(key)
    if key == "id"
      SingularSolrProperty.new(key, _source[key])
    else
      EnrichedSolrPropertyResult.new(key, _source)
    end
  end

end
