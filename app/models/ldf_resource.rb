class LDFResource < ActiveTriples::Resource
  def repository
    @repository ||= CachedFragmentsRepository.new(rdf_subject)
  end

  class CachedFragmentsRepository
    attr_reader :uri
    def initialize(uri)
      @uri = uri
    end

    def query(*args)
      if response.success?
        RDF::Turtle::Reader.new(response.body)
      else
        RDF::Graph.new
      end
    end

    private

    def response
      @response ||= client.get(CGI.escape(uri.to_s)+".ttl")
    end

    def connection_uri
      "http://localhost:4000"
    end

    def client
      @client ||= 
        begin
          c = Hurley::Client.new(connection_uri)
          c.header[:accept] = "text/turtle"
          c
        end
    end
  end
end
