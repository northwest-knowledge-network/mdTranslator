# unpack time instant
# Reader - ADIwg JSON V1 to internal data structure

# History:
# 	Stan Smith 2013-12-11 original script
#   Stan Smith 2014-07-07 resolve require statements using Mdtranslator.reader_module
#   Stan Smith 2014-12-15 refactored to handle namespacing readers and writers

require $ReaderNS.readerModule('module_dateTime')

module ADIWG
    module Mdtranslator
        module Readers
            module MdJson

                module TimeInstant

                    def self.unpack(hTimeInst)

                        # instance classes needed in script
                        intMetadataClass = InternalMetadata.new

                        # time instant
                        intTimeInst = intMetadataClass.newTimeInstant

                        if hTimeInst.has_key?('id')
                            s = hTimeInst['id']
                            if s != ''
                                intTimeInst[:timeId] = s
                            end
                        end

                        if hTimeInst.has_key?('description')
                            s = hTimeInst['description']
                            if s != ''
                                intTimeInst[:description] = s
                            end
                        end

                        # time instant will only be inserted if time position provided
                        if hTimeInst.has_key?('timePosition')
                            s = hTimeInst['timePosition']
                            if s != ''
                                intTimeInst[:timePosition] = $ReaderNS::DateTime.unpack(s)
                            end
                        end

                        return intTimeInst
                    end

                end

            end
        end
    end
end
