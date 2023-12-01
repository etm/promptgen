#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/graphviz'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/cpee'

source = CPEE::Transformation::Source::Graphviz.new(File.read('data/gv/1_2.gv'))
puts source.graph.to_s
trans = CPEE::Transformation::Transformer.new(source)
traces = trans.build_traces
puts traces.legend
puts traces.to_s
trans.build_tree(false)
puts source.tree.to_s
# # pp source.tree
# model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
#
# #puts model
