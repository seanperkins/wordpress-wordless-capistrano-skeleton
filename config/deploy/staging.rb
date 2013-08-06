# Database credentials
set :db_database, "%%STAGING_DB_NAME%%"
set :db_username, "%%STAGING_DB_USER%%"
set :db_password, "%%STAGING_DB_PASSWORD%%"

server "staging.%%APPLICATION%%", :app

set :deploy_to, "/home/%%SERVER_USER%%/public_html/"

role :web, "staging.%%APPLICATION%%"
role :app, "staging.%%APPLICATION%%"

namespace :wordpress_staging do
    task :create_symlink, :roles => :app do
        run "touch #{release_path}/env_staging"
    end
end

after "deploy:create_symlink", "wordpress_staging:create_symlink"