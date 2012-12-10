require 'rvm/capistrano'

require "bundler/capistrano"

set :application, 'linkding'
set :repository,  'git@github.com:dasgib/linkding.git'
set :deploy_to, '/var/www/linkding/staging/'
set :user, 'linkding'

set :scm, :git
set :use_sudo, false

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system

server 'sheldon.railsland.com', :app, :web, :db, primary: true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
