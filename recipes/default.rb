#
# Cookbook Name:: cop_logrotate
# Recipe:: default
# Author:: Copious Inc. <engineering@copiousinc.com>
#

# Ensure logrotate is up to date
package 'logrotate' do
    action :upgrade
end

# Bail if no logrotate entry attributes
unless node['logrotate']['entries']
    return
end
