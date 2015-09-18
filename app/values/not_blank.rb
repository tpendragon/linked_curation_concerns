##
# Value object to deal with blank values.
# @todo Evaluate this. May not be worth it
class NotBlank
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def value
    if @value.blank?
      nil
    else
      @value
    end
  end
end
