require 'rails_helper'

RSpec.describe SolrDocument do
  subject { SolrDocument.new(resource.to_solr) }
  let(:resource) do
    LinkedObject.new
  end
  describe "#[]" do
    context "when enriched" do
      subject { SolrDocument.new(resource.to_solr.merge(enriched)) }
      let(:enriched) do
        {
          :title_ssim => ["http://test.test.org", "Raw String"],
          :title_preferred_label_ssim => ["Test"]
        }
      end
      it "should show title labels together with their preferred label" do
        expect(subject[:title_ssim]).to eq ["Test", "Raw String"]
      end
    end
  end
end
