# Copyright 2021 Google LLC
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

RUN apt-get update && apt-get install -y cmake make ccache python3 libexpat1-dev zlib1g-dev libssh-dev libcurl4-openssl-dev libxml2-utils
RUN git clone https://github.com/Exiv2/exiv2 exiv2 && cd exiv2 && \
    git checkout 10a62b23500954abf7eb2cc3e577bebb21bb0b72
WORKDIR exiv2

COPY build.sh $SRC/
COPY fuzz-read-print-write.cpp $SRC/
