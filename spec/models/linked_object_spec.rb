# Generated via
#  `rails generate curation_concerns:work LinkedObject`
require 'rails_helper'

describe LinkedObject do
  describe "#title" do
    it "should be a MarmottaResource" do
      subject.title << RDF::URI("http://test.com")
      expect(subject.title.first.class).to eq MarmottaResource
    end
  end
end
