#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/cpee'

source = CPEE::Transformation::Source::Mermaid.new(File.read('data/mermaid/1_2.mmd'))
trans = CPEE::Transformation::Transformer.new(source)
traces = trans.build_traces
puts traces.legend(false)
puts traces.to_s(false)
trans.build_tree(false)
puts source.tree.to_s
# pp source.tree
model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s

#puts model
