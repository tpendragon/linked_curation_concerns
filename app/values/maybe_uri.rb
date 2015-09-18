class MaybeURI
  attr_reader :raw_value

  def initialize(raw_value)
    @raw_value = raw_value
  end

  def value
    if uri?
      uri
    else
      raw_value
    end
  end

  def uri?
    String === raw_value && !uri.scheme.blank? && !uri.host.blank?
  end

  private

  def uri
    @uri ||= RDF::URI(raw_value)
  end
end
