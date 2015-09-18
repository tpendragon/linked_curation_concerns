class BasicMetadata < ActiveTriples::Schema
  property :label, predicate: ActiveFedora::RDF::Fcrepo::Model.downloadFilename, multiple: false

  property :depositor, predicate: ::RDF::URI.new('http://id.loc.gov/vocabulary/relators/dpt'), multiple: false

  property :relative_path, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#relativePath'), multiple: false

  property :import_url, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#importUrl'), multiple: false

  property :part_of, predicate: ::RDF::DC.isPartOf
  property :resource_type, predicate: ::RDF::DC.type
  property :title, predicate: ::RDF::DC.title
  property :creator, predicate: ::RDF::DC.creator
  property :contributor, predicate: ::RDF::DC.contributor
  property :description, predicate: ::RDF::DC.description
  property :tag, predicate: ::RDF::DC.relation
  property :rights, predicate: ::RDF::DC.rights
  property :publisher, predicate: ::RDF::DC.publisher
  property :date_created, predicate: ::RDF::DC.created

  # We reserve date_uploaded for the original creation date of the record.
  # For example, when migrating data from a fedora3 repo to fedora4,
  # fedora's system created date will reflect the date when the record
  # was created in fedora4, but the date_uploaded will preserve the
  # original creation date from the old repository.
  property :date_uploaded, predicate: ::RDF::DC.dateSubmitted, multiple: false

  property :date_modified, predicate: ::RDF::DC.modified, multiple: false
  property :subject, predicate: ::RDF::DC.subject
  property :language, predicate: ::RDF::DC.language
  property :identifier, predicate: ::RDF::DC.identifier
  property :based_near, predicate: ::RDF::FOAF.based_near
  property :related_url, predicate: ::RDF::RDFS.seeAlso
  property :bibliographic_citation, predicate: ::RDF::DC.bibliographicCitation
  property :source, predicate: ::RDF::DC.source
end
