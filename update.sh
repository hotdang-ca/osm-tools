#/bin/bash

# (c) 2017 james robert perih

echo 'Updating OSM Data...'

echo 'Downloading British Columbia Data...'
curl http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf --output pbf/british-columbia-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/british-columbia-latest.osm.pbf.md5 --output pbf/british-columbia-latest.osm.pbf.md5

echo 'Downloading Alberta Data...'
curl http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf --output pbf/alberta-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/alberta-latest.osm.pbf.md5 --output pbf/alberta-latest.osm.pbf.md5

echo 'Downloading Saskatchewan Data...'
curl http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf --output pbf/saskatchewan-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/saskatchewan-latest.osm.pbf.md5 --output pbf/saskatchewan-latest.osm.pbf.md5

echo 'Downloading Manitoba Data...'
curl http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf --output pbf/manitoba-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/manitoba-latest.osm.pbf.md5 --output pbf/manitoba-latest.osm.pbf.md5

echo 'Downloading Ontario Data...'
curl http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf --output pbf/ontario-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/ontario-latest.osm.pbf.md5 --output pbf/ontario-latest.osm.pbf.md5

echo 'Downloading Quebec Data...'
curl http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf --output pbf/quebec-latest.osm.pbf
curl http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf.md5 --output pbf/quebec-latest.osm.pbf.md5

echo 'Ready! Do extract.sh pbf/<filename>'
