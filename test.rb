#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/transformer'

source = CPEE::Transformation::Source::Mermaid.new(File.read('data/mermaid/1_2.mmd'))
trans = CPEE::Transformation::Transformer.new(source)
traces = trans.build_traces
puts traces.legend
puts traces.to_s
trans.build_tree(true)
