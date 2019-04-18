# curaengine-dockerfile
Dockerfile for build curaengine

## How to run
### Build Dockerfile

    $ docker build . -t cura
### Run Bash Shell
    $ docker run -it cura /bin/bash
    
### How to slice
Change dir to /CuraEngine/build 

    $ cd /CuraEngine/build
    
#### Get example configs and stl file
    $ wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmprinter.def.json
    $ wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmextruder.def.json
    $ wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/prusa_i3.def.json
    $ wget https://raw.githubusercontent.com/fozbek/curaengine-dockerfile/master/herringbone-gear-large.stl

#### Slice It
    $ ./CuraEngine slice -p -j ./fdmprinter.def.json -j prusa_i3.def.json -l herringbone-gear-large.stl -o herringbone-gear-large.gcode
    
