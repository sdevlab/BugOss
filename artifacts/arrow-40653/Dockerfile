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

FROM gcr.io/oss-fuzz-base/base-builder@sha256:66fb5b08c6f1f93db5ceabac066c11054f6034664ecb750a9278cf74a07ce96e

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y -q && \
    apt-get update -y -q && \
    apt-get install -y -q --no-install-recommends \
        bison \
        build-essential \
        cmake \
        flex \
        libboost-all-dev \
        ninja-build \
        python3

RUN git clone --recurse-submodules \
    https://github.com/apache/arrow.git $SRC/arrow && \
    cd $SRC/arrow && git checkout 3c5b62c116733e434508a8673c2d466776b27eed

COPY build.sh file_fuzz.cc $SRC/
