#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/bpmn2'
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/cpee'

mm = Dir.glob(File.join(__dir__,'data','**/*.mmd'))
gv = Dir.glob(File.join(__dir__,'data','**/*.gv'))
bpmn = Dir.glob(File.join(__dir__,'data','**/*.bpmn'))

### test BPMN2
# source = CPEE::Transformation::Source::BPMN2.new(File.read(bpmn[0]))
# pp source.graph

### test Mermaid
# source = CPEE::Transformation::Source::Mermaid.new(File.read('data/mermaid/1_2.mmd'))
# trans = CPEE::Transformation::Transformer.new(source)
# traces = trans.build_traces
# puts traces.legend
# puts traces.to_s

mm.each do |f|
  source = CPEE::Transformation::Source::Mermaid.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
  File.write(f.sub(/\.mmd$/,'.xml'),model)
end



