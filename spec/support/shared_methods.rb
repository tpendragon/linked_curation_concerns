def build_resource(uri:, label:)
  MarmottaResource.new(uri).tap do |r|
    r.preflabel = label
    r.persist!
  end
end
