#/bin/bash

# (c) 2017 james robert perih

FILE=
LOCATION=
AMENITY=

echo "Extract - amenity extraction tool for OpenStreetMap PBF files"
echo "Part of osmtools"
echo "(c) 2017 James Robert Perih"
echo "james@hotdang.ca"
echo ""

function usage
{
    echo "usage: extract -f file -l location -a amenity | -h"
    echo ""
    echo "  -f <filename>: The filename of the .osm.pbf file"
    echo "  -l <location>: The descriptive name of the Location."
    echo "  -a <amenity_tag>: The tag of the amenity to extract."
    echo ""
    echo "  -h: this screen."
    echo ""
}

function run
{
  echo 'Extracting amenity='$AMENITY' in '$LOCATION' from '$FILE'...'

  osmosis -q --read-pbf $FILE --tf accept-ways amenity=$AMENITY --tf reject-relation --used-node --write-xml output-ways-$LOCATION-$AMENITY.osm
  osmosis -q --read-pbf $FILE --tf accept-nodes amenity=$AMENITY --tf reject-relation --tf reject-ways --write-xml output-nodes-$LOCATION-$AMENITY.osm
  osmosis -q --read-xml ./output-ways-$LOCATION-$AMENITY.osm --read-xml ./output-nodes-$LOCATION-$AMENITY.osm --merge --write-xml $LOCATION-$AMENITY-all.osm

  rm ./output-ways-$LOCATION-$AMENITY.osm
  rm ./output-nodes-$LOCATION-$AMENITY.osm
  echo ''
  echo 'Ready! Do parse.py' $LOCATION'-'$AMENITY'-all.osm'
}

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )           shift
                                FILE=$1
                                ;;
        -l | --location )       shift
                                LOCATION=$1
                                ;;
        -a | --amenity  )       shift
                                AMENITY=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# Validation
error=0

if [ "$FILE" = "" ]; then
  echo "ERROR: You must specify file with -f <filename>"
  error=1
fi

if [ "$LOCATION" = "" ]; then
  echo "ERROR: You must specify a descriptive location with -l <location>"
  error=1
fi

if [ "$AMENITY" = "" ]; then
  echo "ERROR: You must specify an amenity tag to extract with -a <amenity_tag>"
  error=1
fi

if [ "$error" = 1 ]; then
  echo "Correct the parameters, and try again."
  echo ""
  usage
  exit
fi

# still here? Let's run!
run
