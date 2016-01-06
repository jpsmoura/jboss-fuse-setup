#!/usr/bin/env bash

###
# #%L
# GarethHealy :: JBoss Fuse Setup :: Scaffolding Scripts
# %%
# Copyright (C) 2013 - 2015 Gareth Healy
# %%
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
# #L%
###

#export NEXUS_IP | 'vagrant up' sets this as an enviroment var

# Maven Repo
export REMOTE_MAVEN_REPOSITORY='file:\${runtime.home}/\${karaf.default.repository}@snapshots@id=karaf-default, file:\${runtime.data}/maven/upload@snapshots@id=fabric-upload, http://'$NEXUS_IP':8081/nexus/content/groups/public@snapshots@id=local.nexus.public'
export MAVEN_REPOSITORY='file:\${runtime.home}/\${karaf.default.repository}@snapshots@id=karaf-default, file:\${runtime.data}/maven/upload@snapshots@id=fabric-upload, http://'$NEXUS_IP':8081/nexus/content/groups/public@id=local.nexus.public, http://'$NEXUS_IP':8081/nexus/content/repositories/releases@id=local.nexus.releases, http://'$NEXUS_IP':8081/nexus/content/repositories/snapshots@snapshots@id=local.nexus.snapshots'
export PATCH_MAVEN_REPOSITORY="http://$NEXUS_IP:8081/nexus/content/repositories/fusesource-ea@id=local.nexus.fusesource.ea, http://$NEXUS_IP:8081/nexus/content/repositories/fusesource-release@id=local.nexus.fusesource.release"

# Logging
export GAH_LOGGING=log4j.logger.com.garethahealy=TRACE

# Container IPs
fabric1_static="machine1.jbossfuse621.vagrant.local"

amq_hosts="machine2.jbossfuse621.vagrant.local"
app_hosts="machine3.jbossfuse621.vagrant.local"

# Host Config
export ROOT_NODE=($fabric1_static)
export FUSE_HOSTS=($fabric1_static $amq_hosts $app_hosts)
export FABRIC_HOSTS=($amq_hosts $app_hosts)

export APP_HOSTS=($app_hosts)
export BROKER_HOSTS=($amq_hosts)
export GATEWAY_HOSTS=($fabric1_static)

# Host OS paths
export HOST_RH_HOME=/opt/rh
export HOST_FUSE_HOME=/opt/rh/jboss-fuse-6.2.1.redhat-084

# Karaf and application user credentials
export KARAF_USER=admin
export KARAF_PASSWORD=admin
export AMQ_INTERNAL_USER=amq
export AMQ_INTERNAL_PASSWORD=amq

# JVM Options
export JVM_GC_OPTS=""
export JVM_AGENT_OPTS=""
export JVM_BROKER_OPTS="-Xms1024m -Xmx1024m ${JVM_AGENT_OPTS} ${JVM_GC_OPTS}"
export JVM_APP_OPTS="-Xms1024m -Xmx1024m ${JVM_AGENT_OPTS} ${JVM_GC_OPTS}"
export JVM_FABRIC_OPTS="-Xms512m -Xmx512m ${JVM_AGENT_OPTS}"
export JVM_GATEWAY_OPTS="-Xms512m -Xmx512m ${JVM_AGENT_OPTS} ${JVM_GC_OPTS}"

# Root node config
export ROOT_NODE_NAME=fabric-001
export FABRIC_CREATE_CMD="fabric:create --force --clean --resolver manualip --manual-ip=machine1.jbossfuse621.vagrant.local --profile default --wait-for-provisioning"

export DOWNLOAD_FUSE_ZIP="false"
export SHOULD_CLEAR_M2="true"




