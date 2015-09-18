# Generated via
#  `rails generate curation_concerns:work LinkedObject`

class CurationConcerns::LinkedObjectsController < ApplicationController
  include CurationConcerns::CurationConcernController
  set_curation_concern_type LinkedObject
end
