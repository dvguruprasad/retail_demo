set :application, "Retail Demo"
set :repository,  "git@github.com:dvguruprasad/retail_demo.git"

set :scm, :git

role :web, "spree-demo.corporate.thoughtworks.com"                          # Your HTTP server, Apache/etc
role :app, "spree-demo.corporate.thoughtworks.com"                          # This may be the same as your `Web` server
role :db, "spree-demo.corporate.thoughtworks.com" , :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
