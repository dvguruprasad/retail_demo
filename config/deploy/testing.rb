server "spree-demo.corporate.thoughtworks.com", :app, :web, :db, :primary => true

set :rvm_ruby_string, '1.9.3-p0@retail_demo'
set :rvm_type, :user  # Don't use system-wide RVM
set :rails_env, "test"
set :bundle_without, [:development]

ENV["RAILS_ENV"] ||= "test"

namespace :deploy do
  task :start do
    run  <<-CMD
        cd #{deploy_to}/current; RAILS_ENV=#{ENV["RAILS_ENV"]} bundle exec rails s -p 3001
    CMD
  end

  task :stop do
    pid_file = "#{release_path}/tmp/pids/server.pid"
    if File.exists? pid_file
      pid = File.read(pid_file).to_i
      Process.kill 9, pid
      File.delete pid_file
    end
  end

  task :restart do
    deploy.stop
    deploy.start
  end

  task :migrate do
    run "cd /var/www/retail_demo/releases/20121116041137 && RAILS_ENV=#{ENV["RAILS_ENV"]} bundle exec rake db:migrate"
  end

  task :symlink_shared do
    run "ln -s #{shared_path}/images/products #{release_path}/public/spree/products"
  end

end

namespace :bundle do
  task :install do
    run <<-CMD
      cd #{release_path} && RAILS_ENV=#{ENV["RAILS_ENV"]} bundle install --gemfile #{release_path}/Gemfile --path #{shared_path}/bundle
    CMD
  end
end



after 'deploy:update_code', 'deploy:symlink_shared'
