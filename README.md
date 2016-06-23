# bash

**NTTCom-MS/eyp-bash**: [![Build Status](https://travis-ci.org/NTTCom-MS/eyp-bash.png?branch=master)](https://travis-ci.org/NTTCom-MS/eyp-bash)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What bash affects](#what-bash-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with bash](#beginning-with-bash)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

manages some bash dfault settings

## Module Description

Manages the following default settings:

* HISTTIMEFORMAT
* HISTFILESIZE
* HISTSIZE
* HISTCONTROL

Manages **/bin/sh** to point to **/bin/bash**

## Setup

### What bash affects

* bash default settings: **/etc/profile.d/history.sh**
* manages default shell: **/bin/sh**

### Setup Requirements

This module requires pluginsync enabled

### Beginning with bash

```puppet
class { 'bash': }
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

### classes

#### bash

* **default_sh**: Manage default shell (/bin/sh) default: true
* **histtimeformat**: (default: '%d%m%y %H%M%S -> ')
* **histfilesize**: (default: 1000000)
* **histsize**: (default: 1000000)
* **histcontrol**: (default: ignoredups)

### defines

#### bash::alias

* **aliasname**: (default: resource's name)
* **command**: command to aliase
* **user**: optional, apply this alias just to a given user (default: undef)

## Limitations

Should work anywhere, tested on:
* CentOS 5
* CentOS 6
* CentOS 7
* Ubuntu 14.04
* SLES 11 SP3

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
