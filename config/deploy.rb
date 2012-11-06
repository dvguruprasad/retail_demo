require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.
require "rvm/capistrano"

set :stages, %w(testing production)
set :default_stage, "testing"

set :application, "retail_demo"
set :repository,  "git@github.com:dvguruprasad/retail_demo.git"

set :scm, :git
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :branch, "wip"
default_run_options[:pty] = true
