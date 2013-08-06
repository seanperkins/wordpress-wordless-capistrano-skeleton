set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'railsless-deploy'

set :application, "%%APPLICATION%%"
set :repository,  "%%REPOSITORY%%"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names

set :ssh_options, { :forward_agent => true }
set :user, '%%SERVER_USER%%'
set :group, '%%SERVER_GROUP%%'
set :port, '%%SSH_PORT%%'
set :use_sudo, false
default_run_options[:pty] = true

set :deploy_via, :remote_cache
set :copy_exclude, [".git",".DS_Store",".gitignore",".gitmodules"]

namespace :wordpress do
    task :create_symlink, :roles => :app do
      run "ln -nfs #{shared_path}/uploads #{release_path}/content/uploads"
    end
    task :fix_file_permissions, :roles => :app do
      run "find #{release_path} -type d | xargs chmod -v 755 >/dev/null"
      run "find #{release_path} -type f | xargs chmod -v 644 >/dev/null"
    end
end
namespace(:deploy) do
  desc "Backup MySQL Database"
  task :mysqlbackup, :roles => :app do
    run "mysqldump -u#{db_username} -p#{db_password} #{db_database} > #{shared_path}/backups/#{release_name}.sql"
  end
  desc "Restore MySQL Database"
  task :mysqlrestore, :roles => :app do
    backups = capture("ls -1 #{shared_path}/backups/").split("\n")
    default_backup = backups.last
    puts "Available backups: "
    puts backups
    backup = Capistrano::CLI.ui.ask "Which backup would you like to restore? [#{default_backup}] "
    backup_file = default_backup if backup.empty?

    run "mysql -u#{db_username} -p#{db_password} #{db_database} < #{shared_path}/backups/#{backup_file}"
  end
end

after "deploy:create_symlink", "wordpress:create_symlink"
# after "wordpress:create_symlink", "wordpress:fix_file_permissions"