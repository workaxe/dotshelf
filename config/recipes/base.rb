def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
    run "#{sudo} apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison"
    run "#{sudo} apt-get -y install imagemagick libmagickcore-dev libmagickwand-dev"
    
  end
end

namespace :remote do 
  

  def run_with_tty(server, cmd)
    # looks like total pizdets
    command = []
    command += %W( ssh -t #{gateway} -l #{self[:gateway_user] || self[:user]} ) if     self[:gateway]
    command += %W( ssh -t )
    command += %W( -p #{server.port}) if server.port
    command += %W( -l #{user} #{server.host} )
    command += %W( cd #{current_path} )
    # have to escape this once if running via double ssh
    command += [self[:gateway] ? '\&\&' : '&&']
    command += Array(cmd)
    system *command
  end
  
  
  
  desc 'run yarrak'
  task :yarrak do
    run "cd #{current_path}; bundle exec rake notify:create_production_certificate RAILS_ENV=#{rails_env}"
  end
  
  desc 'run push notifications for apple'
  task :rapns do 
    run 'cd #{current_path}; bundle exec rapns production'
  end
  
  desc "reset the database"
  task :reset do
    run "cd #{current_path}; bundle exec rake db:reset RAILS_ENV=#{rails_env}"
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
  
  desc "Remote console" 
  task :console, :roles => :app do
    env = "production"
    server = find_servers(:roles => [:app]).first
    run_with_tty server, %W( ./script/rails console #{env} )
  end

  desc "Remote dbconsole" 
  task :dbconsole, :roles => :app do
    env = stage || "production"
    server = find_servers(:roles => [:app]).first
    run_with_tty server, %W( ./script/rails dbconsole #{env} )
  end
  
  
end