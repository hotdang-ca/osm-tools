#/bin/bash

# (c) 2017 james robert perih

echo 'Updating OSM Data...'

echo 'Downloading British Columbia Data...'
curl http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf.md5 --output pbf/british-columbia-latest.osm.pbf.md5.new
if diff pbf/british-columbia-latest.osm.pbf.md5 pbf/british-columbia-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
else
  rm pbf/british-columbia-latest.osm.pbf.md5
  mv pbf/british-columbia-latest.osm.pbf.md5.new pbf/british-columbia-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf --output pbf/british-columbia-latest.osm.pbf
fi
echo ''

echo 'Downloading Alberta Data...'
curl http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf.md5 --output pbf/alberta-latest.osm.pbf.md5.new
if diff pbf/alberta-latest.osm.pbf.md5 pbf/alberta-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
else
  rm pbf/alberta-latest.osm.pbf.md5
  mv pbf/alberta-latest.osm.pbf.md5.new pbf/alberta-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf --output pbf/alberta-latest.osm.pbf
fi
echo ''

#
# echo 'Downloading Saskatchewan Data...'
# curl http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf --output pbf/saskatchewan-latest.osm.pbf
# curl http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf.md5 --output pbf/saskatchewan-latest.osm.pbf.md5
# echo ''
#
# echo 'Downloading Manitoba Data...'
# curl http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf --output pbf/manitoba-latest.osm.pbf
# curl http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf.md5 --output pbf/manitoba-latest.osm.pbf.md5
# echo ''
#
# echo 'Downloading Ontario Data...'
# curl http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf --output pbf/ontario-latest.osm.pbf
# curl http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf.md5 --output pbf/ontario-latest.osm.pbf.md5
# echo ''
#
# echo 'Downloading Quebec Data...'
# curl http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf --output pbf/quebec-latest.osm.pbf
# curl http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf.md5 --output pbf/quebec-latest.osm.pbf.md5
# echo ''

echo 'Ready! Do extract.sh pbf/<filename>'
