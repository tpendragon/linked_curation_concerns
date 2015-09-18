class MarmottaRepository
  attr_reader :uri
  def initialize(uri)
    @uri = uri
  end

  def query(*args)
    marmotta_resource.get
  end

  def delete(*args)
    marmotta_resource.delete
  end

  def <<(stuff)
    graph = marmotta_resource.get
    graph << stuff
    marmotta_resource.post(graph)
    true
  end

  private

  def marmotta_resource
    @marmotta_resource ||= Marmotta::Resource.new(uri, connection: marmotta_connection)
  end

  def marmotta_connection
    @marmotta ||= Marmotta::Connection.new(
      uri: "http://localhost:8983/marmotta", 
      context: Rails.env
    )
  end
end
