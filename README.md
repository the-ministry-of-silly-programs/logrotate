# Logrotate Cookbook

Manages the rotation of logs via the `logrotate` utility and configuration
files in `/etc/logrotate.d/`.

## Attributes

* `node['logrotate']['entries']` - (hash) - configuration files to create
* `node['logrotate']['entries']['<ENTRY>']` - (hash) - logrotate entry
* `node['logrotate']['entries']['<ENTRY>']['logs']` - (string) - path to logs files
* `node['logrotate']['entries']['<ENTRY>']['frequency']` - (string) - frequency of rotation (daily/weekly/monthly/etc)
* `node['logrotate']['entries']['<ENTRY>']['notifempty']` - (boolean) - don't rotate if log file is empty
* `node['logrotate']['entries']['<ENTRY>']['size']` - (string) - don't rotate if file size smaller than specified
* `node['logrotate']['entries']['<ENTRY>']['rotate']` - (string) - number of rotated logs to keep
* `node['logrotate']['entries']['<ENTRY>']['maxage']` - (string) - do not keep any rotated logs older than specified number of days
* `node['logrotate']['entries']['<ENTRY>']['create']` - (string) - create new log file with specified parameters
* `node['logrotate']['entries']['<ENTRY>']['compress']` - (boolean) - compress rotated log files
* `node['logrotate']['entries']['<ENTRY>']['delaycompress']` - (boolean) - only compress log file after second scheduled rotation
* `node['logrotate']['entries']['<ENTRY>']['dateext']` - (boolean) - use date in file name of rotated logs
* `node['logrotate']['entries']['<ENTRY>']['missingok']` - (boolean) - suppress error if log file is missing
* `node['logrotate']['entries']['<ENTRY>']['postrotate']` - (string) - execute a specific command after rotation
* `node['logrotate']['entries']['<ENTRY>']['sharedscripts']` - (boolean) - execute postrotate command only after all specified logs are rotated

### Example Role
The following role will create `/etc/logrotate.d/example` with the
specified settings.

```
name 'logrotate'
description 'Configure logrotate'

default_attributes({
    logrotate: {
        entries: {
            example: {
                logs: '/var/log/example/*.log',
                frequency: 'weekly',
                notifempty: true,
                size: '100k',
                rotate: '10',
                maxage: '28',
                create: '0644 root root',
                compress: true,
                delaycompress: true,
                dateext: true,
                missingok: true,
                postrotate: 'fortune > /dev/null',
                sharedscripts: true
            }
        }
    }
})

run_list(
    'recipe[cop_logrotate::default]'
)
```
