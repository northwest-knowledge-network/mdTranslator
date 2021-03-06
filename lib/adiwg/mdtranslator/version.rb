# adiwg mdTranslator

# version history

# 0.8.0 2014-09-26 first version to release
# 0.8.1 2014-10-06 used uri from first onlineResource of the resource citation
#              ... as source for datasetURI in iso19115-2 writer
#              ... removed resourceURI from resourceInfo section of adiwgJson
# 0.8.2 2014-10-09 added the 'version' command to the CLI for returning the
#              ... mdTranslator version number
# 0.8.3 2014-10-10 added readme files in kramdown format for each reader and writer
# 0.8.4 2014-10-10 modified writers to pass minimum metadata input test
#              ... test were added to handle a missing metadata > metadataInfo
#              ... block in the input.
# 0.8.5 2014-10-11 added methods to pass content of readme files
# 0.8.6 2014-10-15 added cli option to return entire content mdTranslator response
# 0.8.7 2014-10-29 added support for resource time period
# 0.9.0 2014-11-06 added resourceType to associatedResource and additionalInformation
#              ... moved resourceType from metadataInfo to resourceInfo in json
# 0.9.1 2014-12-01 changed adiwgJson to mdJson
# 0.9.2 2014-12-01 added data dictionary support
# 0.10.0 2014-12-01 added ISO 19110 writer
# 0.10.1 2014-12-04 fixed problem with messages not returned in an array
# 0.10.2 2014-12-05
# 0.11.0 2014-12-15 refactored code managing the readers and writers
#               ... added namespaces to readers and writers
# 0.11.1 2014-12-16 fixed problem of rails not access reader and writer readme files
#               ... changed mdReader and mdWriter to use requested reader and writer
#               ... names to resolved require and call statements
# 0.11.2 2014-12-29 fixed problem with handling xml builder object rather than output
#               ... output string created by builder
# 0.11.3 2015-01-14 change return type from false to $response when writer name is invalid
# 0.12.0 2015-01-16 changed translate entry point method to use keyword parameters
#               ... must now be ruby version 2.0.0 or higher
# 0.12.1 2015-01-21 fixed problem with crash on writer = ''
# 0.13.0 2015-01-28 made data dictionary an array
#               ... added alias to entity and attribute
#               ... added local names to iso 19110 writer
# 1.0.0rc1 2015-02-27 schema 1.0 support

module ADIWG
    module Mdtranslator
        # current mdtranslator version
        VERSION = "1.0.0"
    end
end

