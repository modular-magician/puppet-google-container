# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/container/property/boolean'
require 'google/container/property/cluster_addons_config'
require 'google/container/property/cluster_horizontal_pod_autoscaling'
require 'google/container/property/cluster_http_load_balancing'
require 'google/container/property/cluster_master_auth'
require 'google/container/property/cluster_node_config'
require 'google/container/property/enum'
require 'google/container/property/integer'
require 'google/container/property/keyvaluepairs'
require 'google/container/property/string'
require 'google/container/property/string_array'
require 'google/container/property/time'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcontainer_cluster) do
  @doc = 'A Google Container Engine cluster.'

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  ensurable

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the Cluster.'
  end

  newparam(:zone, parent: Google::Container::Property::String) do
    desc 'The zone where the cluster is deployed'
  end

  newproperty(:name, parent: Google::Container::Property::String) do
    desc <<-DOC
      The name of this cluster. The name must be unique within this project and zone, and can be up
      to 40 characters. Must be Lowercase letters, numbers, and hyphens only. Must start with a
      letter. Must end with a number or a letter.
    DOC
  end

  newproperty(:description, parent: Google::Container::Property::String) do
    desc 'An optional description of this cluster.'
  end

  newproperty(:initial_node_count, parent: Google::Container::Property::Integer) do
    desc <<-DOC
      The number of nodes to create in this cluster. You must ensure that your Compute Engine
      resource quota is sufficient for this number of instances. You must also have available
      firewall and routes quota. For requests, this field should only be used in lieu of a
      "nodePool" object, since this configuration (along with the "nodeConfig") will be used to
      create a "NodePool" object with an auto-generated name. Do not use this and a nodePool at the
      same time.
    DOC
  end

  newproperty(:node_config, parent: Google::Container::Property::ClusterNodeConfig) do
    desc <<-DOC
      Parameters used in creating the cluster's nodes. For requests, this field should only be used
      in lieu of a "nodePool" object, since this configuration (along with the "initialNodeCount")
      will be used to create a "NodePool" object with an auto-generated name. Do not use this and a
      nodePool at the same time. For responses, this field will be populated with the node
      configuration of the first node pool. If unspecified, the defaults are used.
    DOC
  end

  newproperty(:master_auth, parent: Google::Container::Property::ClusterMasterAuth) do
    desc 'The authentication information for accessing the master endpoint.'
  end

  newproperty(:logging_service, parent: Google::Container::Property::Enum) do
    desc <<-DOC
      The logging service the cluster should use to write logs. Currently available options:
      logging.googleapis.com - the Google Cloud Logging service. none - no logs will be exported
      from the cluster. if left as an empty string,logging.googleapis.com will be used.
    DOC
    newvalue('logging.googleapis.com')
    newvalue('none')
  end

  newproperty(:monitoring_service, parent: Google::Container::Property::Enum) do
    desc <<-DOC
      The monitoring service the cluster should use to write metrics. Currently available options:
      monitoring.googleapis.com - the Google Cloud Monitoring service. none - no metrics will be
      exported from the cluster. if left as an empty string, monitoring.googleapis.com will be
      used.
    DOC
    newvalue('monitoring.googleapis.com')
    newvalue('none')
  end

  newproperty(:network, parent: Google::Container::Property::String) do
    desc <<-DOC
      The name of the Google Compute Engine network to which the cluster is connected. If left
      unspecified, the default network will be used. To ensure it exists and it is operations,
      configure the network using 'gcompute_network' resource.
    DOC
  end

  newproperty(:cluster_ipv4_cidr, parent: Google::Container::Property::String) do
    desc <<-DOC
      The IP address range of the container pods in this cluster, in CIDR notation (e.g.
      10.96.0.0/14). Leave blank to have one automatically chosen or specify a /14 block in
      10.0.0.0/8.
    DOC
  end

  newproperty(:addons_config, parent: Google::Container::Property::ClusterAddonsConfig) do
    desc 'Configurations for the various addons available to run in the cluster.'
  end

  newproperty(:subnetwork, parent: Google::Container::Property::String) do
    desc 'The name of the Google Compute Engine subnetwork to which the cluster is connected.'
  end

  newproperty(:location, parent: Google::Container::Property::StringArray) do
    desc <<-DOC
      The list of Google Compute Engine locations in which the cluster's nodes should be located.
    DOC
  end

  newproperty(:endpoint, parent: Google::Container::Property::String) do
    desc <<-DOC
      The IP address of this cluster's master endpoint. The endpoint can be accessed from the
      internet at https://username:password@endpoint/ See the masterAuth property of this resource
      for username and password information. (output only)
    DOC
  end

  newproperty(:initial_cluster_version, parent: Google::Container::Property::String) do
    desc <<-DOC
      The software version of the master endpoint and kubelets used in the cluster when it was
      first created. The version can be upgraded over time. (output only)
    DOC
  end

  newproperty(:current_master_version, parent: Google::Container::Property::String) do
    desc 'The current software version of the master endpoint. (output only)'
  end

  newproperty(:current_node_version, parent: Google::Container::Property::String) do
    desc <<-DOC
      The current version of the node software components. If they are currently at multiple
      versions because they're in the process of being upgraded, this reflects the minimum version
      of all nodes. (output only)
    DOC
  end

  newproperty(:create_time, parent: Google::Container::Property::Time) do
    desc 'The time the cluster was created, in RFC3339 text format. (output only)'
  end

  newproperty(:node_ipv4_cidr_size, parent: Google::Container::Property::Integer) do
    desc <<-DOC
      The size of the address space on each node for hosting containers. This is provisioned from
      within the container_ipv4_cidr range. (output only)
    DOC
  end

  newproperty(:services_ipv4_cidr, parent: Google::Container::Property::String) do
    desc <<-DOC
      The IP address range of the Kubernetes services in this cluster, in CIDR notation (e.g.
      1.2.3.4/29). Service addresses are typically put in the last /16 from the container CIDR.
      (output only)
    DOC
  end

  newproperty(:current_node_count, parent: Google::Container::Property::Integer) do
    desc 'The number of nodes currently in the cluster. (output only)'
  end

  newproperty(:expire_time, parent: Google::Container::Property::Time) do
    desc 'The time the cluster will be automatically deleted in RFC3339 text format. (output only)'
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end
