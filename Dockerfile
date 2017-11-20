From ubuntu:16.04
RUN apt-get -y update
RUN apt-get -y install git wget autoconf automake libtool curl make g++ unzip cmake python3 python3-dev python3-sip-dev

RUN wget https://github.com/google/protobuf/releases/download/v3.5.0/protobuf-all-3.5.0.zip

RUN git clone https://github.com/Ultimaker/libArcus.git
RUN git clone https://github.com/Ultimaker/CuraEngine.git

# install protobuf
RUN unzip protobuf-all-3.5.0.zip
WORKDIR "/protobuf-3.5.0"
RUN ./autogen.sh && ./configure && make && make install && ldconfig

# install libArcus
WORKDIR "/libArcus"
RUN mkdir build && cd build && cmake .. && make && make install

# install curaengine
WORKDIR "/CuraEngine"
RUN mkdir build && cd build && cmake .. && make


# note: ./CuraEngine slice -p -j ./fdmprinter.def.json -j prusa_i3.def.json -l catStandingM_0904_010.stl -o catStandingM_0904_010.gcode
# Copy the executable cureengine to somewhere.
#
#-rwxr-xr-x   1 CuraEngine
#
#-rw-r--r--   1 libArcus.so.1.1.0
#-rwxr-xr-x   1 libprotobuf.so.15.0.0
#lrw-r--r--   1 libArcus.so.3 -> libArcus.so.1.1.0
#lrwxr-xr-x   1 libprotobuf.so.15 -> libprotobuf.so.15.0.0
#
# config file form cura
# wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmextruder.def.json
# wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmprinter.def.json
# wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/prusa_i3.def.json
# -rw-r--r--   1 prusa_i3.def.json
# -rw-r--r--   1 fdmextruder.def.json
# -rw-r--r--   1 fdmprinter.def.json
#        
# test modelfile
# -rw-r--r--   1 catStandingM_0904_010.gcode
# -rw-r--r--   1 catStandingM_0904_010.stl
