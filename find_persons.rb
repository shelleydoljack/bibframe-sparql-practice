#! /usr/bin/env ruby

require 'rdf'
require 'linkeddata'

graph = RDF::Graph.load("my.rdf")

puts "The graph object: #{graph.inspect}"

q = "
  PREFIX bf:<http://bibframe.org/vocab/>
  SELECT *
  WHERE {
    ?person a bf:Person.
    }
  "

query = SPARQL.parse(q)
puts "The sparql query: #{query.inspect}"

# puts graph.to_ttl

query.execute(graph) do |result|
  puts result.person
end
