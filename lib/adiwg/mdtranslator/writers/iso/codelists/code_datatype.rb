# ISO <<CodeLists>> gmd:MD_DatatypeCode

# from http://mdtranslator.adiwg.org/api/codelists?format=xml
# History:
# 	Stan Smith 2013-10-21 original script
#   Stan Smith 2014-10-15 allow non-ISO codesNames to be rendered
#   Stan Smith 2014-12-12 refactored to handle namespacing readers and writers
#   Stan Smith 2014-12-15 replaced NOAA CT_CodelistCatalogue with mdTranslator CT_CodelistCatalogue

module ADIWG
    module Mdtranslator
        module Writers
            module Iso

                class MD_DatatypeCode
                        def initialize(xml)
                            @xml = xml
                        end

                        def writeXML(codeName)
                            case (codeName)
                                when 'class' then
                                    codeID = '001'
                                when 'codelist' then
                                    codeID = '002'
                                when 'enumeration' then
                                    codeID = '003'
                                when 'codelistElement' then
                                    codeID = '004'
                                when 'abstractClass' then
                                    codeID = '005'
                                when 'aggregatedClass' then
                                    codeID = '006'
                                when 'specifiedClass' then
                                    codeID = '007'
                                when 'datatypeClass' then
                                    codeID = '008'
                                when 'interfaceClass' then
                                    codeID = '009'
                                when 'unionClass' then
                                    codeID = '010'
                                when 'metaClass' then
                                    codeID = '011'
                                when 'typeClass' then
                                    codeID = '012'
                                when 'characterString' then
                                    codeID = '013'
                                when 'integer' then
                                    codeID = '014'
                                when 'association' then
                                    codeID = '015'
                                else
                                    codeID = 'non-ISO codeName'
                            end

                            # write xml
                            @xml.tag!('gmd:MD_DatatypeCode', {:codeList => 'http://mdtranslator.adiwg.org/api/codelists?format=xml#MD_DatatypeCode',
                                                              :codeListValue => "#{codeName}",
                                                              :codeSpace => "#{codeID}"})
                        end

                end

            end
        end
    end
end
