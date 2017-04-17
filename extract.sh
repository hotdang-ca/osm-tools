#/bin/bash

# (c) 2017 james robert perih

FILE=$1
LOCATION=$2
AMENITY=$3

echo 'Parsing file' $FILE 'for amenity='$AMENITY' in '$LOCATION '...'

osmosis -q --read-pbf $FILE --tf accept-ways amenity=$AMENITY --tf reject-relation --tf reject-nodes --used-node --write-xml output-ways-$LOCATION-$AMENITY.osm
osmosis -q --read-pbf $FILE --tf accept-nodes amenity=$AMENITY --tf reject-relation --tf reject-ways --write-xml output-nodes-$LOCATION-$AMENITY.osm
osmosis -q --read-xml ./output-ways-$LOCATION-$AMENITY.osm --read-xml ./output-nodes-$LOCATION-$AMENITY.osm --merge --write-xml $LOCATION-$AMENITY-all.osm

rm ./output-ways-$LOCATION-$AMENITY.osm
rm ./output-nodes-$LOCATION-$AMENITY.osm

echo 'Ready! Do show.py' $LOCATION'-'$AMENITY'-all.osm'
