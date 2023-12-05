#!/usr/bin/ruby
require_relative 'lib/cpee/transformation/bpmn2'
require_relative 'lib/cpee/transformation/mermaid'
require_relative 'lib/cpee/transformation/graphviz'
require_relative 'lib/cpee/transformation/transformer'
require_relative 'lib/cpee/transformation/cpee'
require_relative 'lib/cpee/transformation/text-df-PO-reduced'
require_relative 'lib/cpee/transformation/text-df-PO-extended'
require_relative 'lib/cpee/transformation/text-bf'

mm = Dir.glob(File.join(__dir__,'data','**/*.mmd'))
gv = Dir.glob(File.join(__dir__,'data','**/*.gv'))
bpmn = Dir.glob(File.join(__dir__,'data','**/*.bpmn'))

#########################################################################################################
### Write CPEE trees (CPEE XML models) - use load model in the cpee
#########################################################################################################
mm.each do |f|
  source = CPEE::Transformation::Source::Mermaid.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
  File.write(f.sub(/\.mmd$/,'.xml'),model)
end
gv.each do |f|
  source = CPEE::Transformation::Source::Graphviz.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
  File.write(f.sub(/\.gv$/,'.xml'),model)
end
bpmn.each do |f|
  source = CPEE::Transformation::Source::BPMN2.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  model = trans.generate_model(CPEE::Transformation::Target::CPEE).to_s
  File.write(f.sub(/\.bpmn$/,'.xml'),model)
end

#########################################################################################################
### Write-Depth First, Pre-Order traversed texts with reduced context (better for small models)
#########################################################################################################
mm.each do |f|
  source = CPEE::Transformation::Source::Mermaid.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_reduced)
  File.write(f.sub(/\.mmd$/,'.df-po-reduced.txt'),text)
end
gv.each do |f|
  source = CPEE::Transformation::Source::Graphviz.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_reduced)
  File.write(f.sub(/\.gv$/,'.df-po-reduced.txt'),text)
end
bpmn.each do |f|
  source = CPEE::Transformation::Source::BPMN2.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_reduced)
  File.write(f.sub(/\.bpmn$/,'.df-po-reduced.txt'),text)
end

#########################################################################################################
### Write-Depth First, Pre-Order traversed texts with extended context (better for large, nested models)
#########################################################################################################
mm.each do |f|
  source = CPEE::Transformation::Source::Mermaid.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_extended)
  File.write(f.sub(/\.mmd$/,'.df-po-extended.txt'),text)
end
gv.each do |f|
  source = CPEE::Transformation::Source::Graphviz.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_extended)
  File.write(f.sub(/\.gv$/,'.df-po-extended.txt'),text)
end
bpmn.each do |f|
  source = CPEE::Transformation::Source::BPMN2.new(File.read(f))
  trans = CPEE::Transformation::Transformer.new(source)
  trans.build_traces
  trans.build_tree
  text = trans.generate_model(CPEE::Transformation::Target::Text_df_PO_extended)
  File.write(f.sub(/\.bpmn$/,'.df-po-extended.txt'),text)
end
