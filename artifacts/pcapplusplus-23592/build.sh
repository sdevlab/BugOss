#!/bin/bash -eu
#
# Copyright 2020 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

mv $SRC/FuzzTarget.cpp $SRC/PcapPlusPlus/Tests/Fuzzers/
sed -i "712d" $SRC/PcapPlusPlus/Packet++/src/Packet.cpp
sed -i "712i fprintf(stderr, \"[BugOSS] src/PcapPlusPlus/Packet++/src/Packet.cpp:712\"); return new NullLoopbackLayer((uint8_t*)rawData, rawDataLen, this);" $SRC/PcapPlusPlus/Packet++/src/Packet.cpp

TARGETS_DIR=Tests/Fuzzers/Bin

# Build libpcap
cd $SRC/libpcap/
./configure
make -j$(nproc)

CXXFLAGS=$(echo $CXXFLAGS | sed 's/\-O1/\-O0/g')
CFLAGS=$(echo $CFLAGS | sed 's/\-O1/\-O0/g')
export CXXFLAGS=$CXXFLAGS
export CFLAGS=$CFLAGS

# Build PcapPlusPlus linking statically against the built libpcap
cd $SRC/PcapPlusPlus
./configure-fuzzing.sh --libpcap-static-lib-dir $SRC/libpcap/
make clean
make -j$(nproc) fuzzers

# Copy target and options
cp $TARGETS_DIR/FuzzTarget $OUT
cp $(ldd $OUT/FuzzTarget | cut -d" " -f3) $OUT
cp $SRC/default.options $OUT/FuzzTarget.options

# Copy corpora
cd $SRC/tcpdump
zip -jr FuzzTarget_seed_corpus.zip tests/*.pcap
cp FuzzTarget_seed_corpus.zip $OUT/
