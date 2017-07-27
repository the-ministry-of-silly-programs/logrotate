#
# Cookbook Name:: cop_logrotate
# Recipe:: default
# Author:: Copious Inc. <engineering@copiousinc.com>
#

# Ensure logrotate is up to date
Package 'logrotate' do
    action :upgrade
End

# Bail if no logrotate entry attributes
Unless node['logrotate']['entries']
    return
End

# Configure logrotate entries
Node['logrotate']['entries'].each do |entry, data|
    template entry do
        path "/etc/logrotate.d/#{entry}"
        source 'logrotate.erb'
        owner 'root'
        group 'root'
        mode  0644
        action :create
        variables ({
            data: data
        })
    end
End
