root = "/home/deployer/apps/pazario/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.pazario.sock"
worker_processes 2
timeout 30
