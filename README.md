# profile_umask

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_umask](#setup)
    * [What profile_umask affects](#what-profile_umask-affects)
1. [Usage - Configuration options and additional functionality](#usage)

## Description

This module should modify the default user umask.

## Setup

### What profile_umask affects 

This modifies /etc/profile, /etc/login.defs, and /etc/csh.cshrc. The changes are to the login
umask. It will only change the umask if the umask is the default 022. The 
default umask in hiera to change to is 077.


## Usage

To install and configure:

```
include ::profile_umask
```

## Reference

[REFERENCE.md](REFERENCE.md)

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
[![pdk-validate](https://github.com/ncsa/puppet-profile_umask/actions/workflows/pdk-validate.yml/badge.svg)](https://github.com/ncsa/puppet-profile_umask/actions/workflows/pdk-validate.yml)
[![yamllint](https://github.com/ncsa/puppet-profile_umask/actions/workflows/yamllint.yaml/badge.svg)](https://github.com/ncsa/puppet-profile_umask/actions/workflows/yamllint.yaml)
