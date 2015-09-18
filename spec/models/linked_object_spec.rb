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

  it "should enrich URIs" do
    build_resource(uri: "http://test.com", label: "Hydra Test")
    subject.title << RDF::URI("http://test.com")
    subject.apply_depositor_metadata("bah")
    subject.save

    document = ActiveFedora::SolrService.query("id:#{RSolr.solr_escape(subject.id)}").first
    presenter = CurationConcerns::GenericWorkShowPresenter.new(SolrDocument.new(document), nil)
    expect(presenter.to_s).to eq "Hydra Test"
  end
end
