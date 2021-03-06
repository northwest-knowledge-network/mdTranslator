# unpack data quality
# Reader - ADIwg JSON V1 to internal data structure

# History:
# 	Stan Smith 2013-11-26 original script
#   Stan Smith 2014-07-03 resolve require statements using Mdtranslator.reader_module
#   Stan Smith 2014-12-15 refactored to handle namespacing readers and writers

require $ReaderNS.readerModule('module_lineage')

module ADIWG
    module Mdtranslator
        module Readers
            module MdJson

                module DataQuality

                    def self.unpack(hDataQual)

                        # instance classes needed in script
                        intMetadataClass = InternalMetadata.new
                        intDataQual = intMetadataClass.newDataQuality

                        # data quality - scope
                        if hDataQual.has_key?('scope')
                            s = hDataQual['scope']
                            if s != ''
                                intDataQual[:dataScope] = s
                            end
                        end

                        # data quality - report
                        # on hold

                        # data quality - lineage
                        if hDataQual.has_key?('lineage')
                            hLineage = hDataQual['lineage']
                            unless hLineage.empty?
                                intDataQual[:dataLineage] = $ReaderNS::Lineage.unpack(hLineage)
                            end
                        end

                        return intDataQual
                    end

                end

            end
        end
    end
end