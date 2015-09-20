require 'rails_helper'

RSpec.describe LDFResource do
  subject { LDFResource.new("http://impossible.com.z") }

  context "when there's something" do
    before do
      WebMock.disable!
      build_resource(uri: "http://impossible.com.z", label: "Testing")
      WebMock.enable!
    end
    it "should return it" do
      expect(subject.statements.to_a.length).to eq 1
      expect(WebMock).not_to have_requested(:get, "http://localhost:8983/marmotta/resource?uri=http://impossible.com.z")
    end
  end
end
