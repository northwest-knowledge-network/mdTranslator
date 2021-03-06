# unpack additional documentation
# Reader - ADIwg JSON V1 to internal data structure

# History:
# 	Stan Smith 2014-11-06 original script
#   Stan Smith 2014-12-15 refactored to handle namespacing readers and writers
#   Stan Smith 2014-12-30 added return if empty input
#   ... found & fixed error of method using associatedResource object instead of
#   ... additionalDocumentation object

require $ReaderNS.readerModule('module_citation')

module ADIWG
    module Mdtranslator
        module Readers
            module MdJson

                module AdditionalDocumentation

                    def self.unpack(hAddDoc)

                        # return nil object if input is empty
                        intAddDoc = nil
                        return if hAddDoc.empty?

                        # instance classes needed in script
                        intMetadataClass = InternalMetadata.new
                        intAddDoc = intMetadataClass.newAdditionalDocumentation

                        # additional documentation - resource type
                        if hAddDoc.has_key?('resourceType')
                            s = hAddDoc['resourceType']
                            if s != ''
                                intAddDoc[:resourceType] = s
                            end
                        end

                        # additional documentation - resource citation
                        if hAddDoc.has_key?('citation')
                            hCitation = hAddDoc['citation']
                            unless hCitation.empty?
                                intAddDoc[:citation] = $ReaderNS::Citation.unpack(hCitation)
                            end
                        end

                        return intAddDoc
                    end

                end

            end
        end
    end
end
