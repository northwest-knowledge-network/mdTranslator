# unpack bounding box
# Reader - ADIwg JSON V1 to internal data structure

# History:
# 	Stan Smith 2013-11-07 original script
#   Stan Smith 2014-04-28 reorganized for json schema 0.3.0

require Rails.root + 'metadata/internal/internal_metadata_obj'

module AdiwgV1BoundingBox

	def self.unpack(aBBox)

		# instance classes needed in script
		intMetadataClass = InternalMetadata.new
		intBBox = intMetadataClass.newBoundingBox

		# unpack GeoJSON bounding box elements
		west = aBBox[0]
		south = aBBox[1]
		east = aBBox[2]
		north = aBBox[3]

		# validate coordinates if easting +/-180 and northing +/-90
		valid = false
		if (180 >= west) && (west >= -180)
			if (90 >= south) && (south >= -90)
				if (180 >= east) && (east >= -180)
					if (90 >= north) &&(north >= -90)
						valid = true
					end
				end
			end
		end

		# build internal geo element if valid
		if valid
			intBBox[:westLong] = west
			intBBox[:eastLong] = east
			intBBox[:southLat] = south
			intBBox[:northLat] = north
			return intBBox
		else
			return nil
		end

	end

end
