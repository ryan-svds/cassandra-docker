#!/bin/sh
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERSION="2.1.5"
SHA1="a7b8f911f4b1c11a715a11f19b0b99d54e0f440a"
TARBALL="apache-cassandra-${VERSION}-bin.tar.gz"
URL="http://www.apache.dist/cassandra/${VERSION}/${TARBALL}"

cd /

set -e
set -x

# download the tarball from an Apache mirror
# verify the checksum
# untar in /opt, cleanup, symlink to /opt/cassandra

echo "${SHA1} ${TARBALL}" > ${TARBALL}.sha1

# copy in from the Dockerfile for now to save downloads
curl -O -s ${URL}

sha1sum --check ${TARBALL}.sha1

tar -xzf ${TARBALL} -C /opt

rm -f ${TARBALL} ${TARBALL}.sha1

ln -s /opt/apache-cassandra-$VERSION /opt/cassandra

rm -f $0
