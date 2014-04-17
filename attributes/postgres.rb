default['skylab']['postgresql']['password'] = 'password'
default['postgresql']['password']['postgres'] = "password"

default['postgresql']['config_pgtune']['db_type'] = "web"
default['postgresql']['pg_hba'] = [
    {:type => 'local',    :db => 'all', :user => 'postgres', :addr => '',                       :method => 'ident'},
    {:type => 'local',    :db => 'all', :user => 'all',      :addr => '',                       :method => 'md5'},
    {:type => 'host',     :db => 'all', :user => 'all',      :addr => '127.0.0.1/32',           :method => 'md5'},
    {:type => 'host',     :db => 'all', :user => 'all',      :addr => '0.0.0.0/0',              :method => 'md5'},
    {:type => 'host',     :db => 'all', :user => 'all',      :addr => '0.0.0.0/0',              :method => 'password'},
    {:type => 'hostssl',  :db => 'all', :user => 'all',      :addr => '0.0.0.0/0',              :method => 'password'},
    {:type => 'host',     :db => 'all', :user => 'all',      :addr => '::1/128',                :method => 'md5'},
    {:type => 'host',     :db => 'all', :user => 'all',      :addr => '::ffff:127.0.0.1/128',   :method => 'md5'},
    {:type => 'local',    :db => 'all', :user => 'postgres', :addr => '',                       :method => 'password'},
]
