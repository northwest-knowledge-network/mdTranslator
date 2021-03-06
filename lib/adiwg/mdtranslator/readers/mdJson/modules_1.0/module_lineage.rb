# unpack lineage
# Reader - ADIwg JSON V1 to internal data structure

# History:
# 	Stan Smith 2013-11-26 original script
#   Stan Smith 2014-07-03 resolve require statements using Mdtranslator.reader_module
#   Stan Smith 2014-12-15 refactored to handle namespacing readers and writers

require $ReaderNS.readerModule('module_processStep')
require $ReaderNS.readerModule('module_source')

module ADIWG
    module Mdtranslator
        module Readers
            module MdJson

                module Lineage

                    def self.unpack(hLineage)

                        # instance classes needed in script
                        intMetadataClass = InternalMetadata.new
                        intDataLine = intMetadataClass.newLineage

                        # lineage - statement
                        if hLineage.has_key?('statement')
                            s = hLineage['statement']
                            if s != ''
                                intDataLine[:statement] = s
                            end
                        end

                        # lineage - process steps
                        if hLineage.has_key?('processStep')
                            aProcSteps = hLineage['processStep']
                            unless aProcSteps.empty?
                                aProcSteps.each do |hProcStep|
                                    intDataLine[:processSteps] << $ReaderNS::ProcessStep.unpack(hProcStep)
                                end
                            end
                        end

                        # lineage - data sources
                        if hLineage.has_key?('source')
                            aSources = hLineage['source']
                            unless aSources.empty?
                                aSources.each do |hSource|
                                    intDataLine[:dataSources] << $ReaderNS::Source.unpack(hSource)
                                end
                            end
                        end

                        return intDataLine
                    end

                end

            end
        end
    end
end
