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

# Configure logrotate entries
node['logrotate']['entries'].each do |entry, data|
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
end
