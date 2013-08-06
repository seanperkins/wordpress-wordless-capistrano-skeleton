# Database credentials
set :db_database, "%%PRODUCTION_DB_NAME%%"
set :db_username, "%%PRODUCTION_DB_USER%%"
set :db_password, "%%PRODUCTION_DB_PASSWORD%%"

server "%%APPLICATION%%", :app

set :deploy_to, "/home/%%SERVER_USER%%/public_html/"


namespace :wordpress_production do
    task :create_symlink, :roles => :app do
        run "touch #{release_path}/env_production"
    end
end

after "deploy:create_symlink", "wordpress_production:create_symlink"