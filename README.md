# puppet-lint no ERB templates check

[![Actions Status](https://github.com/deanwilson/puppet-lint-no_erb_template-check/workflows/Ruby/badge.svg)](https://github.com/deanwilson/puppet-lint-no_erb_template-check/actions)

As part of the migration to a cleaner, Puppet 4 enhanced, code base one
of the suggestions is to move from the old ERB (Embedded Ruby)
templates to the newer, kinder, gentler `epp` (Embedded Puppet
Programming) equivalents. You can find more details in the
[Templating with Embedded Puppet Programming Language - EPP](http://puppet-on-the-edge.blogspot.co.uk/2014/03/templating-with-embedded-puppet.html) blog post.

The lint check in this plugin will raise a warning anywhere a
`template()` or `inline_template()` function call is found in your
manifests. It's worth noting that this plugin will probably raise a lot
of warnings if you use external modules that maintain Puppet 3
compatibility; and will be of most use in new, Puppet 4 only code bases.

## Installation

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-no_erb_template-check'

and then run `bundle install`.

## Usage

This plugin provides two new checks to `puppet-lint`.

    'inline_template() function call. Use inline_epp() instead'

    'template() function call. Use epp() instead'

## Other puppet-lint plugins

You can find a list of my `puppet-lint` plugins in the
[unixdaemon puppet-lint-plugins](https://github.com/deanwilson/unixdaemon-puppet-lint-plugins) repo.

### Author

[Dean Wilson](http://www.unixdaemon.net)

### License

 * MIT
