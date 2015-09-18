# Generated via
#  `rails generate curation_concerns:work LinkedObject`
module CurationConcerns
  class LinkedObjectActor < CurationConcerns::BaseActor
    include ::CurationConcerns::WorkActorBehavior

    def attributes
      @cleaned_attributes ||= CleanedAttributes.new(super).to_h
    end
  end
end
