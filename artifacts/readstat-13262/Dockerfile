# Copyright 2019 Evan Miller
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
MAINTAINER emmiller@gmail.com
RUN apt-get update && apt-get install -y make autoconf automake gettext libtool zip zlib1g-dev 

RUN git clone https://github.com/WizardMac/ReadStat readstat && cd readstat && \
    git checkout 1de4f389a8ffb07775cb1d99e33cbfa7e96bccf2
WORKDIR readstat
COPY build.sh $SRC/
COPY fuzz_format_sas7bdat.c $SRC/
