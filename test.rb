#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/graphviz'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/text-df-PO-reduced'

source = CPEE::Transformation::Source::Mermaid.new(File.read('data/mermaid-bptm/G_j01.mmd'))
 puts source.graph.to_s
trans = CPEE::Transformation::Transformer.new(source)

traces = trans.build_traces
puts traces.legend
puts traces.to_s

trans.build_tree(false)
puts source.tree.to_s

puts trans.generate_model(CPEE::Transformation::Target::Text_df_PO_reduced)
