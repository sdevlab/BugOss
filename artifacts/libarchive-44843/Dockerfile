# Copyright 2016 Google Inc.
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

FROM gcr.io/oss-fuzz-base/base-builder@sha256:66fb5b08c6f1f93db5ceabac066c11054f6034664ecb750a9278cf74a07ce96e

RUN apt-get update && apt-get install -y make autoconf automake libtool pkg-config \
        libbz2-dev liblzo2-dev liblzma-dev liblz4-dev libz-dev \
        libssl-dev libacl1-dev libattr1-dev lrzip \
              liblz4-tool lzop zstd lcab genisoimage jlha-utils rar default-jdk
RUN git clone https://github.com/libarchive/libarchive.git && cd libarchive && git checkout 52efa50c69653029687bfc545703b7340b7a51e2
RUN git clone https://gitlab.gnome.org/GNOME/libxml2.git && cd libxml2 && git checkout b041d829a211072bdab0026219b5a428268648d4

COPY build.sh libarchive_fuzzer.cc $SRC/
WORKDIR $SRC
