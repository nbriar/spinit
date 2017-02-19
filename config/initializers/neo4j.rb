require 'neo4j/core/cypher_session'
require 'neo4j/core/cypher_session/adaptors'
require 'neo4j/core/cypher_session/adaptors/http'

adaptor = Neo4j::Core::CypherSession::Adaptors::HTTP.new(Rails.configuration.x.neo4j_db_url)
NEO = Neo4j::Core::CypherSession.new(adaptor)
