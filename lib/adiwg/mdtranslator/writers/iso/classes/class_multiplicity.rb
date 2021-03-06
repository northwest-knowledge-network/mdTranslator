# ISO <<Class>> Multiplicity & MultiplicityRange
# writer output in XML
# definition: cardinality (0..1, 0..*, 1..1, 1..*)
# uncertain how this is used for attributes of relational tables since
# ... cardinality is defined between tables, not for attributes.
# ... documentation by NOAA and modelManager suggest best practice for
# ... propertyType is to default to 1.
# ... I assume this is using cardinality like optionality.
# ... therefore ...
# ... lower = 0 => Null
# ... lower = 1 => NotNull
# ... upper not provided a value, but is required to be present

# History:
# 	Stan Smith 2014-12-02 original script
#   Stan Smith 2014-12-12 refactored to handle namespacing readers and writers

module ADIWG
    module Mdtranslator
        module Writers
            module Iso

                class Multiplicity

                    def initialize(xml)
                        @xml = xml
                    end

                    def writeXML(allowNull)

                        # xml for iso classes Multiplicity and MultiplicityRange
                        @xml.tag!('gco:Multiplicity') do
                            @xml.tag!('gco:range') do
                                @xml.tag!('gco:MultiplicityRange') do
                                    @xml.tag!('gco:lower') do
                                        if !allowNull
                                            range = 1
                                        else
                                            range = 0
                                        end
                                        @xml.tag!('gco:Integer', range)
                                    end
                                    @xml.tag!('gco:upper')
                                end
                            end
                        end

                    end

                end

            end
        end
    end
end
