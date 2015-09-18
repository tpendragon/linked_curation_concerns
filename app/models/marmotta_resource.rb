class MarmottaResource < ActiveTriples::Resource
  property :preflabel, :predicate => RDF::SKOS.prefLabel
  def repository
    @repository ||= MarmottaRepository.new(rdf_subject)
  end

  def preferred_label
    if rdf_label.first != rdf_subject.to_s
      rdf_label.first
    end
  end
end
