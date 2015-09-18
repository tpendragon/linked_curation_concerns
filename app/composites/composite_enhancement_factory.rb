##
# A composite for Enhancement Factories.
# @example CompositeEnhancementFactory.new(LabelEnhancement,
#   AltLabelEnhancement)
class CompositeEnhancementFactory
  attr_reader :factories
  def initialize(*factories)
    @factories = factories
  end

  def new(property)
    CompositeEnhancement.new(factories, property)
  end

  class CompositeEnhancement
    attr_reader :factories, :property
    def initialize(factories, property)
      @factories = factories
      @property = property
    end

    # @return [Array<SolrProperty>] Property result of all the contained
    # enhancements.
    def properties
      enhancements.flat_map(&:properties)
    end

    private

    def enhancements
      @enhancements ||= factories.map do |factory|
        factory.new(@property)
      end
    end
  end
end
