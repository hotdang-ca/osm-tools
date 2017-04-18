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
## Step 1: Update
Get the pbf files required.
```
chmod +x ./update.sh
./update.sh
```

This will proceed to check MD5 hashes between the known sources, and the local copy. If they match, no update is required. If they don’t match, the pbf file is downloaded.

### Step 2: Extract
The `./extract.sh` file can be made +x:
```
chmod +x ./extract.sh
```

Then, perform the parsing with the following format:
```
extract.sh -f <filename> -l <location> -a <amenity>
```

Ex:
```
extract.sh -f ./pbf/manitoba-latest.osm.pbf -l Manitoba -a restaurant
```

You’ll then receive a `<location>-<amenity>-all.osm` file!

### Step 3: Parse
The included ./parse.py can also be made +x:
```
chmod +x ./parse.py
```

Then, perform the parsing with the following format:
```
parse.py <filename>.osm "[filter]"
```

Eg:
```
parse.py ./Manitoba-restaurant-all.opm
```
or
```
parse.py ./Manitoba-restaurant-all.opm "McDonald's"
```

The `parse.py` file currently lists all `Nodes` effectively; extracting name, latitude, and longitude coordinates. `Way` types are dealt with separately; first by also ensuring the reference nodes are collected, and then compared with the first Way node. While this will generate a point which is not located in the centre of that item, it will at least define the starting place, and be pretty darn close.

## TODO:
* Error handling
