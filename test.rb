#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/graphviz'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/text-df-PO-reduced'

source = CPEE::Transformation::Source::Graphviz.new(File.read('data/gv-bptm/R_g01.gv'))
puts source.graph.to_s
trans = CPEE::Transformation::Transformer.new(source)

traces = trans.build_traces
puts traces.legend
puts traces.to_s

trans.build_tree(false)
puts source.tree.to_s

puts trans.generate_model(CPEE::Transformation::Target::Text_df_PO_reduced)
