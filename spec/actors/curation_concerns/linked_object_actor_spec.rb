# Generated via
#  `rails generate curation_concerns:work LinkedObject`
require 'rails_helper'

describe CurationConcerns::LinkedObjectActor do
  subject { described_class.new(curation_concern, user, input_attributes) }

  let(:curation_concern) { LinkedObject.new }
  let(:user) { instance_double(User, user_key: "test") }

  describe "#create" do
    before do
      allow(curation_concern).to receive(:save)
    end
    let(:input_attributes) do
      {
        :title => [ "http://test.com" ]
      }
    end
    context "when given a URI" do
      it "should save it as an RDF::URI" do
        subject.create

        expect(curation_concern.title_ids.first).to eql RDF::URI("http://test.com")
      end
    end
  end
end
