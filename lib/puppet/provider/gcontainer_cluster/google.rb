# Copyright 2017 Google Inc.
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

require 'google/container/network/delete'
require 'google/container/network/get'
require 'google/container/network/post'
require 'google/container/network/put'
require 'google/container/property/boolean'
require 'google/container/property/cluster_addons_config'
require 'google/container/property/cluster_horizontal_pod_autoscaling'
require 'google/container/property/cluster_http_load_balancing'
require 'google/container/property/cluster_master_auth'
require 'google/container/property/cluster_node_config'
require 'google/container/property/enum'
require 'google/container/property/integer'
require 'google/container/property/namevalues'
require 'google/container/property/string'
require 'google/container/property/string_array'
require 'google/container/property/time'
require 'google/hash_utils'
require 'google/object_store'
require 'puppet'

Puppet::Type.type(:gcontainer_cluster).provide(:google) do
  mk_resource_methods

  def self.instances
    debug('instances')
    raise [
      '"puppet resource" is not supported at the moment:',
      'TODO(nelsonjr): https://goto.google.com/graphite-bugs-view?id=167'
    ].join(' ')
  end

  def self.prefetch(resources)
    debug('prefetch')
    resources.each do |name, resource|
      project = resource[:project]
      debug("prefetch #{name}") if project.nil?
      debug("prefetch #{name} @ #{project}") unless project.nil?
      fetch = fetch_resource(resource, self_link(resource))
      resource.provider = present(name, fetch, resource) unless fetch.nil?
      Google::ObjectStore.instance.add(:gcontainer_cluster, resource)
    end
  end

  def self.present(name, fetch, resource)
    result = new(
      { title: name, ensure: :present }.merge(fetch_to_hash(fetch, resource))
    )
    result.instance_variable_set(:@fetched, fetch)
    result
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.fetch_to_hash(fetch, resource)
    {
      name: Google::Container::Property::String.api_munge(fetch['name']),
      description:
        Google::Container::Property::String.api_munge(fetch['description']),
      master_auth: Google::Container::Property::ClusterMasterAuth.api_munge(
        fetch['masterAuth']
      ),
      logging_service:
        Google::Container::Property::Enum.api_munge(fetch['loggingService']),
      monitoring_service:
        Google::Container::Property::Enum.api_munge(fetch['monitoringService']),
      network: Google::Container::Property::String.api_munge(fetch['network']),
      cluster_ipv4_cidr:
        Google::Container::Property::String.api_munge(fetch['clusterIpv4Cidr']),
      addons_config:
        Google::Container::Property::ClusterAddonsConfig.api_munge(
          fetch['addonsConfig']
        ),
      subnetwork:
        Google::Container::Property::String.api_munge(fetch['subnetwork']),
      location:
        Google::Container::Property::StringArray.api_munge(fetch['location']),
      endpoint:
        Google::Container::Property::String.api_munge(fetch['endpoint']),
      initial_cluster_version: Google::Container::Property::String.api_munge(
        fetch['initialClusterVersion']
      ),
      current_master_version: Google::Container::Property::String.api_munge(
        fetch['currentMasterVersion']
      ),
      current_node_version: Google::Container::Property::String.api_munge(
        fetch['currentNodeVersion']
      ),
      create_time:
        Google::Container::Property::Time.api_munge(fetch['createTime']),
      node_ipv4_cidr_size: Google::Container::Property::Integer.api_munge(
        fetch['nodeIpv4CidrSize']
      ),
      services_ipv4_cidr: Google::Container::Property::String.api_munge(
        fetch['servicesIpv4Cidr']
      ),
      current_node_count: Google::Container::Property::Integer.api_munge(
        fetch['currentNodeCount']
      ),
      expire_time:
        Google::Container::Property::Time.api_munge(fetch['expireTime']),
      initial_node_count: resource[:initial_node_count],
      node_config: resource[:node_config]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def exists?
    debug("exists? #{@property_hash[:ensure] == :present}")
    @property_hash[:ensure] == :present
  end

  def create
    debug('create')
    @created = true
    create_req = Google::Container::Network::Post.new(collection(@resource),
                                                      fetch_auth(@resource),
                                                      'application/json',
                                                      resource_to_request)
    @fetched = wait_for_operation create_req.send, @resource
    @property_hash[:ensure] = :present
  end

  def destroy
    debug('destroy')
    @deleted = true
    delete_req = Google::Container::Network::Delete.new(self_link(@resource),
                                                        fetch_auth(@resource))
    wait_for_operation delete_req.send, @resource
    @property_hash[:ensure] = :absent
  end

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    update_req = Google::Container::Network::Put.new(self_link(@resource),
                                                     fetch_auth(@resource),
                                                     'application/json',
                                                     resource_to_request)
    @fetched = wait_for_operation update_req.send, @resource
  end

  def dirty(field, from, to)
    @dirty = {} if @dirty.nil?
    @dirty[field] = {
      from: from,
      to: to
    }
  end

  def exports
    {
      endpoint: @fetched['endpoint'],
      master_auth: @fetched['masterAuth'],
      name: resource[:name]
    }
  end

  private

  # rubocop:disable Metrics/MethodLength
  def self.resource_to_hash(resource)
    {
      project: resource[:project],
      name: resource[:name],
      description: resource[:description],
      initial_node_count: resource[:initial_node_count],
      node_config: resource[:node_config],
      master_auth: resource[:master_auth],
      logging_service: resource[:logging_service],
      monitoring_service: resource[:monitoring_service],
      network: resource[:network],
      cluster_ipv4_cidr: resource[:cluster_ipv4_cidr],
      addons_config: resource[:addons_config],
      subnetwork: resource[:subnetwork],
      location: resource[:location],
      endpoint: resource[:endpoint],
      initial_cluster_version: resource[:initial_cluster_version],
      current_master_version: resource[:current_master_version],
      current_node_version: resource[:current_node_version],
      create_time: resource[:create_time],
      node_ipv4_cidr_size: resource[:node_ipv4_cidr_size],
      services_ipv4_cidr: resource[:services_ipv4_cidr],
      current_node_count: resource[:current_node_count],
      expire_time: resource[:expire_time],
      zone: resource[:zone]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def resource_to_request
    request = {
      name: @resource[:name],
      description: @resource[:description],
      initialNodeCount: @resource[:initial_node_count],
      nodeConfig: @resource[:node_config],
      masterAuth: @resource[:master_auth],
      loggingService: @resource[:logging_service],
      monitoringService: @resource[:monitoring_service],
      network: @resource[:network],
      clusterIpv4Cidr: @resource[:cluster_ipv4_cidr],
      addonsConfig: @resource[:addons_config],
      subnetwork: @resource[:subnetwork],
      location: @resource[:location]
    }.reject { |_, v| v.nil? }
    # Format request to conform with API endpoint
    request = encode_request(request)
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request.to_json
  end
  # rubocop:enable Metrics/MethodLength

  def fetch_auth(resource)
    self.class.fetch_auth(resource)
  end

  def self.fetch_auth(resource)
    Puppet::Type.type(:gauth_credential).fetch(resource)
  end

  def debug(message)
    puts("DEBUG: #{message}") if ENV['PUPPET_HTTP_VERBOSE']
    super(message)
  end

  def self.collection(data)
    URI.join(
      'https://container.googleapis.com/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/clusters',
        data
      )
    )
  end

  def collection(data)
    self.class.collection(data)
  end

  def self.self_link(data)
    URI.join(
      'https://container.googleapis.com/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/clusters/{{name}}',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
  end

  def self.return_if_object(response)
    raise "Bad response: #{response.body}" \
      if response.is_a?(Net::HTTPBadRequest)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w[error errors], 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    result
  end

  def return_if_object(response)
    self.class.return_if_object(response)
  end

  def self.extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def self.expand_variables(template, var_data, extra_data = {})
    data = if var_data.class <= Hash
             var_data.merge(extra_data)
           else
             resource_to_hash(var_data).merge(extra_data)
           end
    extract_variables(template).each do |v|
      unless data.key?(v)
        raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
    end
    template
  end

  def expand_variables(template, var_data, extra_data = {})
    self.class.expand_variables(template, var_data, extra_data)
  end

  def fetch_resource(resource, self_link)
    self.class.fetch_resource(resource, self_link)
  end

  def async_op_url(data, extra_data = {})
    URI.join(
      'https://container.googleapis.com/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/operations/{{op_id}}',
        data, extra_data
      )
    )
  end

  def wait_for_operation(response, resource)
    op_result = return_if_object(response)
    return if op_result.nil?
    status = ::Google::HashUtils.navigate(op_result, %w[status])
    fetch_resource(
      resource,
      URI.parse(::Google::HashUtils.navigate(wait_for_completion(status,
                                                                 op_result,
                                                                 resource),
                                             %w[targetLink]))
    )
  end

  def wait_for_completion(status, op_result, resource)
    op_id = ::Google::HashUtils.navigate(op_result, %w[name])
    op_uri = async_op_url(resource, op_id: op_id)
    while status != 'DONE'
      debug("Waiting for completion of operation #{op_id}")
      raise_if_errors op_result, %w[error errors], 'message'
      sleep 1.0
      raise "Invalid result '#{status}' on gcontainer_cluster." \
        unless %w[PENDING RUNNING DONE ABORTING].include?(status)
      op_result = fetch_resource(resource, op_uri)
      status = ::Google::HashUtils.navigate(op_result, %w[status])
    end
    op_result
  end

  def raise_if_errors(response, err_path, msg_field)
    self.class.raise_if_errors(response, err_path, msg_field)
  end

  # Google Container Engine API has its own layout for the create method,
  # defined like this:
  #
  # {
  #   'cluster': {
  #     ... cluster data
  #   }
  # }
  #
  # Format the request to match the expected input by the API
  def self.encode_request(resource_request)
    {
      'cluster' => resource_request
    }
  end

  def encode_request(resource_request)
    self.class.encode_request(resource_request)
  end

  def self.fetch_resource(resource, self_link)
    get_request = ::Google::Container::Network::Get.new(
      self_link, fetch_auth(resource)
    )
    return_if_object get_request.send
  end

  def self.raise_if_errors(response, err_path, msg_field)
    errors = ::Google::HashUtils.navigate(response, err_path)
    raise_error(errors, msg_field) unless errors.nil?
  end

  def self.raise_error(errors, msg_field)
    raise IOError, ['Operation failed:',
                    errors.map { |e| e[msg_field] }.join(', ')].join(' ')
  end
end
