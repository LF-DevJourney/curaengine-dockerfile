From ubuntu:16.04
RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install build-essential

RUN git clone https://github.com/google/protobuf.git
RUN git clone https://github.com/Ultimaker/libArcus.git
RUN git clone https://github.com/Ultimaker/CuraEngine.git

# https://github.com/google/protobuf/blob/master/src/README.md
RUN apt-get -y install autoconf automake libtool curl make g++ unzip
RUN cd protobuf
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make check
RUN make install
RUN ldconfig

#https://github.com/Ultimaker/libArcus
cd -
RUN apt-get -y install python3 python3-dev python3-sip-dev


apt -y install wget


wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmextruder.def.json
wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/fdmprinter.def.json
wget https://raw.githubusercontent.com/Ultimaker/Cura/master/resources/definitions/prusa_i3.def.json

./CuraEngine slice -p -j ./fdmprinter.def.json -j prusa_i3.def.json -l catStandingM_0904_010.stl -o catStandingM_0904_010.gcode

From ubuntu:16.04
RUN apt-get -y update
RUN apt-get -y install git


#https://github.com/Ultimaker/CuraEngine#installing-protobuf
apt-get -y install autoconf automake libtool make curl g++ unzip cmake

protobuf-all-3.5.0.zip
cd protobuf-3.5.0

./autogen.sh
./configure
make
make install
ldconfig

# libArcus   https://github.com/Ultimaker/libArcus#building
apt-get -y install python3 python3-dev python3-sip-dev

mkdir build && cd build
cmake ..
make
make install



# curaengine https://github.com/Ultimaker/CuraEngine#how-to-install
mkdir build && cd build
cmake ..
make
