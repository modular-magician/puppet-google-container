# How to become a contributor and submit your own code

## Contributor License Agreements

We'd love to accept your sample apps and patches! Before we can take them, we
have to jump a couple of legal hurdles.

Please fill out either the individual or corporate Contributor License
Agreement (CLA).

  * If you are an individual writing original source code and you're sure you
    own the intellectual property, then you'll need to sign an [individual CLA]
    (https://developers.google.com/open-source/cla/individual).
  * If you work for a company that wants to allow you to contribute your work,
    then you'll need to sign a [corporate CLA]
    (https://developers.google.com/open-source/cla/corporate).

Follow either of the two links above to access the appropriate CLA and
instructions for how to sign and return it. Once we receive it, we'll
be able to accept your pull requests.

## Contributing A Patch

1. Submit an issue describing your proposed change to the repo in question.
1. The repo owner will respond to your issue promptly.
1. If your proposed change is accepted, and you haven't already done so, sign a
   Contributor License Agreement (see details above).
1. Fork the desired repo, develop and test your code changes.
1. Ensure that your code adheres to the existing style in the sample to which
   you are contributing.
1. Ensure that your code has an appropriate set of unit tests which all pass.
1. Submit a pull request.

## Style

We adhere as much as possible to the [ruby-style-guide][] and make the code
[rubocop][] compliant. Tests are setup to fail if there are style guide
violations.

## Testing

Please make sure all tests pass before sending a patch. This will help us to
approve your change faster.

As a matter of policy the master branch is always passing all tests, and changes
that break tests cannot be accepted. If that's your case reach out and we can
help you get it fixed.

### Running Tests

```
gem install bundler
bundle install
bundle exec rspec
bundle exec rubocop
```

## Auto generated files

Various of the files in this repository are automatically generated by
puppet-codegen. Such files contain a prominent comment warning for its
auto generated origins. However some types, such as JSON or MD, do not allow
embedding comments without breaking the file or causing side effects.

### Changing auto generated files

Of course these files are not perfect there will inevitably be issues with them.
If you find an issue with them there are 2 options:

1. Send a patch to the affected files to us and we'll update the source used to
   generate the file, thus addressing the issue. Note that in this option your
   patch will not be accepted but will be used as a guide to fix the original
   file.

2. Change the file directly in the sources used by puppet-codegen. By taking
   this approach your change will be attributed to you, as you'd be the author
   of the change. If you'd like to take credit for the change this is the
   recommended approach. This approach has the nice side effect to fix all other
   projects that have the same issue at once.

### File list

The list below contains all the files that were automatically generated by
puppet-codegen:

  * .gitignore
  * .rubocop.yml
  * .tools/end2end/data/cluster.pp
  * .tools/end2end/data/delete_cluster.pp
  * .tools/end2end/data/delete_node_pool.pp
  * .tools/end2end/data/kube_config.pp
  * .tools/end2end/data/node_pool.pp
  * CHANGELOG.md
  * CONTRIBUTING.md
  * examples/cluster.pp
  * examples/delete_cluster.pp
  * examples/delete_node_pool.pp
  * examples/kube_config.pp
  * examples/node_pool.pp
  * Gemfile
  * lib/google/container/api/gcontainer_node_pool.rb
  * lib/google/container/network/base.rb
  * lib/google/container/network/delete.rb
  * lib/google/container/network/get.rb
  * lib/google/container/network/post.rb
  * lib/google/container/network/put.rb
  * lib/google/container/property/array.rb
  * lib/google/container/property/base.rb
  * lib/google/container/property/boolean.rb
  * lib/google/container/property/cluster_addons_config.rb
  * lib/google/container/property/cluster_horizontal_pod_autoscaling.rb
  * lib/google/container/property/cluster_http_load_balancing.rb
  * lib/google/container/property/cluster_master_auth.rb
  * lib/google/container/property/cluster_name.rb
  * lib/google/container/property/cluster_node_config.rb
  * lib/google/container/property/enum.rb
  * lib/google/container/property/integer.rb
  * lib/google/container/property/namevalues.rb
  * lib/google/container/property/nodepool_autoscaling.rb
  * lib/google/container/property/nodepool_config.rb
  * lib/google/container/property/nodepool_management.rb
  * lib/google/container/property/nodepool_upgrade_options.rb
  * lib/google/container/property/string.rb
  * lib/google/container/property/string_array.rb
  * lib/google/container/property/time.rb
  * lib/google/hash_utils.rb
  * lib/google/object_store.rb
  * lib/google/string_utils.rb
  * lib/puppet/provider/gcontainer_cluster/google.rb
  * lib/puppet/provider/gcontainer_kube_config/google.rb
  * lib/puppet/provider/gcontainer_node_pool/google.rb
  * lib/puppet/type/gcontainer_cluster.rb
  * lib/puppet/type/gcontainer_kube_config.rb
  * lib/puppet/type/gcontainer_node_pool.rb
  * metadata.json
  * README.md
  * spec/.rubocop.yml
  * spec/bundle.rb
  * spec/copyright.rb
  * spec/copyright_spec.rb
  * spec/data/copyright_bad1.rb
  * spec/data/copyright_bad2.rb
  * spec/data/copyright_good1.rb
  * spec/data/copyright_good2.rb
  * spec/data/network/gcontainer_cluster/success1~name.yaml
  * spec/data/network/gcontainer_cluster/success1~title.yaml
  * spec/data/network/gcontainer_cluster/success2~name.yaml
  * spec/data/network/gcontainer_cluster/success2~title.yaml
  * spec/data/network/gcontainer_cluster/success3~name.yaml
  * spec/data/network/gcontainer_cluster/success3~title.yaml
  * spec/data/network/gcontainer_node_pool/success1~name.yaml
  * spec/data/network/gcontainer_node_pool/success1~title.yaml
  * spec/data/network/gcontainer_node_pool/success2~name.yaml
  * spec/data/network/gcontainer_node_pool/success2~title.yaml
  * spec/data/network/gcontainer_node_pool/success3~name.yaml
  * spec/data/network/gcontainer_node_pool/success3~title.yaml
  * spec/fake_auth.rb
  * spec/gcontainer_cluster_provider_spec.rb
  * spec/gcontainer_node_pool_provider_spec.rb
  * spec/hash_utils_spec.rb
  * spec/network_blocker.rb
  * spec/network_blocker_spec.rb
  * spec/network_delete_spec.rb
  * spec/network_get_spec.rb
  * spec/network_post_spec.rb
  * spec/network_put_spec.rb
  * spec/puppetlint_spec.rb
  * spec/spec_helper.rb
  * spec/string_utils_spec.rb
  * spec/test_constants.rb
  * tasks/README.md
  * tasks/resize.json
  * tasks/resize.rb

The list below contains all the files that were automatically sourced from a
central location:

  * .tools/README.md
  * Gemfile.lock
  * LICENSE
  * spec/data/poor_example.pp

[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://rubocop.readthedocs.io/en/latest/
