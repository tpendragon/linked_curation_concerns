require 'rails_helper'

RSpec.describe LabelEnhancement do
  subject { described_class.new(property) }
  let(:property) { SolrProperty.new("title_sim", value) }
  let(:value) { "http://localhost:40/1" }

  describe "#properties" do
    context "when there's a label" do
      it "should return a nice property" do
        build_resource(uri: value, label: "Test")

        property = subject.properties.first
        expect(property.values).to eq ["Test"]
        expect(property.key).to eq "title_preferred_label"
        expect(property.solr_identifier).to eq "sim"
      end
    end
    context "when there's no label" do
      it "should return an empty array property" do
        expect(subject.properties.first.values).to eq []
      end
    end
  end
end
