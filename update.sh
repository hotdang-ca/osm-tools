#/bin/bash

# (c) 2017 james robert perih

echo 'Updating OSM Data...'

echo 'Downloading British Columbia Data...'
curl -s http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf.md5 --output pbf/british-columbia-latest.osm.pbf.md5.new
if diff pbf/british-columbia-latest.osm.pbf.md5 pbf/british-columbia-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/british-columbia-latest.osm.pbf.md5.new
else
  rm pbf/british-columbia-latest.osm.pbf.md5
  mv pbf/british-columbia-latest.osm.pbf.md5.new pbf/british-columbia-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf --output pbf/british-columbia-latest.osm.pbf
fi
echo ''

echo 'Downloading Alberta Data...'
curl -s http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf.md5 --output pbf/alberta-latest.osm.pbf.md5.new
if diff pbf/alberta-latest.osm.pbf.md5 pbf/alberta-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/alberta-latest.osm.pbf.md5.new
else
  rm pbf/alberta-latest.osm.pbf.md5
  mv pbf/alberta-latest.osm.pbf.md5.new pbf/alberta-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf --output pbf/alberta-latest.osm.pbf
fi
echo ''

echo 'Downloading Saskatchewan Data...'
curl -s http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf.md5 --output pbf/saskatchewan-latest.osm.pbf.md5.new
if diff pbf/saskatchewan-latest.osm.pbf.md5 pbf/saskatchewan-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/saskatchewan-latest.osm.pbf.md5.new
else
  rm pbf/saskatchewan-latest.osm.pbf.md5
  mv pbf/saskatchewan-latest.osm.pbf.md5.new pbf/saskatchewan-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf --output pbf/saskatchewan-latest.osm.pbf
fi
echo ''

echo 'Downloading Manitoba Data...'
curl -s http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf.md5 --output pbf/manitoba-latest.osm.pbf.md5.new
if diff pbf/manitoba-latest.osm.pbf.md5 pbf/manitoba-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/manitoba-latest.osm.pbf.md5.new
else
  rm pbf/manitoba-latest.osm.pbf.md5
  mv pbf/manitoba-latest.osm.pbf.md5.new pbf/manitoba-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf --output pbf/manitoba-latest.osm.pbf
fi
echo ''

echo 'Downloading Ontario Data...'
curl -s http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf.md5 --output pbf/ontario-latest.osm.pbf.md5.new
if diff pbf/ontario-latest.osm.pbf.md5 pbf/ontario-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/ontario-latest.osm.pbf.md5.new
else
  rm pbf/ontario-latest.osm.pbf.md5
  mv pbf/ontario-latest.osm.pbf.md5.new pbf/ontario-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf --output pbf/ontario-latest.osm.pbf
fi
echo ''

echo 'Downloading Quebec Data...'
curl -s http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf.md5 --output pbf/quebec-latest.osm.pbf.md5.new
if diff pbf/quebec-latest.osm.pbf.md5 pbf/quebec-latest.osm.pbf.md5.new > /dev/null ; then
  echo "Already up-to-date. Skipping"
  rm pbf/quebec-latest.osm.pbf.md5.new
else
  rm pbf/quebec-latest.osm.pbf.md5
  mv pbf/quebec-latest.osm.pbf.md5.new pbf/quebec-latest.osm.pbf.md5
  curl http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf --output pbf/quebec-latest.osm.pbf
fi
echo ''

echo 'Ready! Do extract.sh pbf/<filename>'
