# Generated via
#  `rails generate curation_concerns:work LinkedObject`
class LinkedObject < ActiveFedora::Base
  def self.property(property, opts)
    super property, {class_name: LDFResource}.merge(opts)
  end
  include ::CurationConcerns::GenericWorkBehavior
  include ::CurationConcerns::BasicMetadata
  validates_presence_of :title,  message: 'Your work must have a title.'
  after_save :enrich

  private

  def enrich
    Enricher.new(id).enrich!
  end
end
