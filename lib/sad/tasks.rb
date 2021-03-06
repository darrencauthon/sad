namespace :sad do
	task :setup do
		if defined?(Rails)
			Rake::Task["environment"].invoke
		end
		ENV['SAD_OLD_ROOT'] = Dir.pwd
	end

	desc "start sad with args - COUNT=4 QUEUE=sosad DIR=./tmp/pids LIBS=lib/a.rb,ext/b.so"
	task :start => [ :setup ] do
		ENV['COUNT'] = '1' unless ENV['COUNT']
		opts = {
			:dir => ENV['DIR'],
			:multiple => true,
			:log_output => true,
			:backtrace  => true,
			:ARGV => ['start']
		}
		Sad::Runner.exec(opts)
	end

	desc "stop sad with args - COUNT=4 QUEUE=sosad DIR=./tmp/pids LIBS=lib/a.rb,ext/b.so"
	task :stop => [ :setup ] do
		ENV['COUNT'] = '1' unless ENV['COUNT']
		opts = {
			:dir => ENV['DIR'],
			:multiple => true,
			:log_output => true,
			:backtrace  => true,
			:ARGV => ['stop']
		}
		Sad::Runner.exec(opts)
	end

	desc "restart sad with args - COUNT=4 QUEUE=sosad DIR=./tmp/pids LIBS=lib/a.rb,ext/b.so"
	task :restart => [ :setup ] do
		ENV['COUNT'] = '1' unless ENV['COUNT']
		opts = {
			:dir => ENV['DIR'],
			:multiple => true,
			:log_output => true,
			:backtrace  => true,
			:ARGV => ['restart']
		}
		Sad::Runner.exec(opts)
	end

    desc "ontop sad with args - QUEUE=sosad DIR=./tmp/pids LIBS=lib/a.rb,ext/b.so"
    task :ontop => [ :setup ] do
		ENV['COUNT'] = '1'
        opts = {
                :dir => ENV['DIR'],
                :multiple => true,
                :log_output => true,
                :backtrace  => true,
                :ontop => true,
                :ARGV => ['start']
        }
        Sad::Runner.exec(opts)
    end
end
