require 'rails_helper'

RSpec.describe MarmottaResource do
  subject { MarmottaResource.new(subject_uri) }
  let(:subject_uri) { RDF::URI("http://impossible.com.z/ns/1") }

  context "when new" do
    it "should have no statements" do
      expect(subject.statements.to_a.length).to eq 0
    end
  end
  it "should be able to handle not having a URI passed" do
    expect{described_class.new}.not_to raise_error
  end
  it "should be able to persist multiple resources" do
    subject << [subject.rdf_subject, RDF::DC.title, "test"]
    subject.persist!

    resource_2 = described_class.new("http://impossible.com.z/ns/2")
    resource_2 << [resource_2.rdf_subject, RDF::DC.title, "Another Test"]
    resource_2.persist!
    resource_2.clear
    resource_2 << [resource_2.rdf_subject, RDF::DC.title, "Second Title"]
    resource_2.persist!

    reloaded_1 = described_class.new(subject_uri)
    reloaded_2 = described_class.new(resource_2.rdf_subject)

    expect(reloaded_1.statements.to_a.length).to eq 1
    expect(reloaded_2.statements.to_a.length).to eq 1
  end
  context "when persisted with statements" do
    before do
      subject << [subject.rdf_subject, RDF::DC.title, "Test"]
      subject.persist!
    end
    it "should be able to be reloaded and maintain those statements" do
      reloaded_resource = described_class.new(subject_uri)
      expect(reloaded_resource.query([nil, RDF::DC.title, nil]).statements.to_a.length).to eq 1
      expect(reloaded_resource.statements.to_a.length).to eq 1
      expect(reloaded_resource.statements.to_a.first.subject).to eq subject.rdf_subject
    end
  end
end
