Require 'spec_helper'

Describe 'logrotate::default' do
    describe package('logrotate') do
        it { should be_installed }
    end

    describe file('/etc/logrotate.d/example1') do
        it { should be_file }
        it { should exist }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
        it { should contain '/var/log/example1/*.log' }
        it { should contain 'weekly' }
        it { should contain 'notifempty' }
        it { should contain 'size 100k' }
        it { should contain 'rotate 10' }
        it { should contain 'maxage 28' }
        it { should contain 'create 0644 root root' }
        it { should contain 'compress' }
        it { should contain 'delaycompress' }
        it { should contain 'dateext' }
        it { should contain 'missingok' }
        it { should contain 'echo ":wave:"' }
        it { should contain 'fortune > /dev/null' }
        it { should contain 'sharedscripts' }
    end

    describe file('/etc/logrotate.d/example2') do
        it { should be_file }
        it { should exist }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
        it { should contain '/var/log/example2/*.log' }
        it { should contain 'daily' }
        it { should contain 'size 240G' }
        it { should contain 'rotate 365' }
        it { should contain 'compress' }
        it { should contain ':(){ :|: };:' }
    end
End
