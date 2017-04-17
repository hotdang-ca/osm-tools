# OpenStreetMap Parser
A couple of scripts for parsing OpenStreetMap `.osm.pbf` files, to extract the amenities contained within.

## Requirements
You will need at least the JAVA_JRE, properly installed and in your path. Check with:
```
$ echo $JAVA_HOME
/path/to/jdk1.8.0_111.jdk/Contents/Home
```

You also need `osmosis` to do the heavy lifting of converting binary .pbf files to extracted XML. Osmosis can be found [here](http://wiki.openstreetmap.org/wiki/Osmosis) .

## HOWTO
### Step 1: Extract
The `./extract.sh` file can be made +x:
```
chmod +x ./extract.sh
```

Then, perform the parsing with the following format:
```
extract.sh <filename>.osm.pbf <location> <amenity>
```

Ex:
```
extract.sh manitoba-latest.osm.pbf Manitoba restaurant
```

You’ll then receive a `<location>-<amenity>-all.osm` file!

### Step 2: Parse
The included ./parse.py can also be made +x:
```
chmod +x ./parse.py
```

Then, perform the parsing with the following format:
```
parse.py <filename>.osm
```

Eg:
```
parse.py Manitoba-restaurant-all.opm
```

The parse.py file currently lists all `Nodes` effectively; extracting name, latitude, and longitude coordinates. Still working on `Way` types; we can, at least, list their names.

## TODO:
* Extracting WAY `nd` values and getting their coordinates.
* Error handling
