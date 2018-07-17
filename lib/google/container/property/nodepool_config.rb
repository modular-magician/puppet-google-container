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

require 'google/container/property/base'

module Google
  module Container
    module Data
      # A class to manage data for Config for node_pool.
      class NodePoolConfig
        include Comparable

        attr_reader :machine_type
        attr_reader :disk_size_gb
        attr_reader :oauth_scopes
        attr_reader :service_account
        attr_reader :metadata
        attr_reader :image_type
        attr_reader :labels
        attr_reader :local_ssd_count
        attr_reader :tags
        attr_reader :preemptible

        def to_json(_arg = nil)
          {
            'machineType' => machine_type,
            'diskSizeGb' => disk_size_gb,
            'oauthScopes' => oauth_scopes,
            'serviceAccount' => service_account,
            'metadata' => metadata,
            'imageType' => image_type,
            'labels' => labels,
            'localSsdCount' => local_ssd_count,
            'tags' => tags,
            'preemptible' => preemptible
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            machine_type: machine_type,
            disk_size_gb: disk_size_gb,
            oauth_scopes: oauth_scopes,
            service_account: service_account,
            metadata: metadata,
            image_type: image_type,
            labels: labels,
            local_ssd_count: local_ssd_count,
            tags: tags,
            preemptible: preemptible
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? NodePoolConfig
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? NodePoolConfig
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        private

        def compare_fields(other)
          [
            { self: machine_type, other: other.machine_type },
            { self: disk_size_gb, other: other.disk_size_gb },
            { self: oauth_scopes, other: other.oauth_scopes },
            { self: service_account, other: other.service_account },
            { self: metadata, other: other.metadata },
            { self: image_type, other: other.image_type },
            { self: labels, other: other.labels },
            { self: local_ssd_count, other: other.local_ssd_count },
            { self: tags, other: other.tags },
            { self: preemptible, other: other.preemptible }
          ]
        end
      end

      # Manages a NodePoolConfig nested object
      # Data is coming from the GCP API
      class NodePoolConfigApi < NodePoolConfig
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @machine_type = Google::Container::Property::String.api_munge(args['machineType'])
          @disk_size_gb = Google::Container::Property::Integer.api_munge(args['diskSizeGb'])
          @oauth_scopes = Google::Container::Property::StringArray.api_munge(args['oauthScopes'])
          @service_account = Google::Container::Property::String.api_munge(args['serviceAccount'])
          @metadata = Google::Container::Property::NameValues.api_munge(args['metadata'])
          @image_type = Google::Container::Property::String.api_munge(args['imageType'])
          @labels = Google::Container::Property::NameValues.api_munge(args['labels'])
          @local_ssd_count = Google::Container::Property::Integer.api_munge(args['localSsdCount'])
          @tags = Google::Container::Property::StringArray.api_munge(args['tags'])
          @preemptible = Google::Container::Property::Boolean.api_munge(args['preemptible'])
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a NodePoolConfig nested object
      # Data is coming from the Puppet manifest
      class NodePoolConfigCatalog < NodePoolConfig
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @machine_type = Google::Container::Property::String.unsafe_munge(args['machine_type'])
          @disk_size_gb = Google::Container::Property::Integer.unsafe_munge(args['disk_size_gb'])
          @oauth_scopes =
            Google::Container::Property::StringArray.unsafe_munge(args['oauth_scopes'])
          @service_account =
            Google::Container::Property::String.unsafe_munge(args['service_account'])
          @metadata = Google::Container::Property::NameValues.unsafe_munge(args['metadata'])
          @image_type = Google::Container::Property::String.unsafe_munge(args['image_type'])
          @labels = Google::Container::Property::NameValues.unsafe_munge(args['labels'])
          @local_ssd_count =
            Google::Container::Property::Integer.unsafe_munge(args['local_ssd_count'])
          @tags = Google::Container::Property::StringArray.unsafe_munge(args['tags'])
          @preemptible = Google::Container::Property::Boolean.unsafe_munge(args['preemptible'])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to Config for node_pool.
      class NodePoolConfig < Google::Container::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::NodePoolConfigCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::NodePoolConfigApi.new(value)
        end
      end
    end
  end
end
