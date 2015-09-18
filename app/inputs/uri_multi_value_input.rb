class UriMultiValueInput < MultiValueInput

  private

  def build_field(value, index)
    options = build_field_options(value, index)
    URIEnabledStringField.new(@builder, attribute_name, options).field
  end
end
