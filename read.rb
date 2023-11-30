require_relative 'lib/cpee/transformation/bpmn2'
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/cpee'

mm = Dir.glob(File.join(__dir__,'data','**/*.mmd'))
gv = Dir.glob(File.join(__dir__,'data','**/*.gv'))
bpmn = Dir.glob(File.join(__dir__,'data','**/*.bpmn'))

#source = CPEE::Transformation::Source::BPMN2.new(File.read(bpmn[0]))
#pp source.graph

source = CPEE::Transformation::Source::Mermaid.new(File.read('data/mermaid/1_2.mmd'))
pp source.graph

# trans = CPEE::Transformation::Transformer.new(source)
# trans.build_traces
# trans.build_tree(false)
# puts trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
