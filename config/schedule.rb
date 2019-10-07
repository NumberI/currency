set :environment, ENV['RAILS_ENV']
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :job_template, nil
env :PATH, ENV['PATH']
set :bundle_command, 'bundle exec'
job_type :runner,  "cd :path && :bundle_command rails runner -e :environment ':task' :output"
ENV.each { |k, v| env(k, v) }
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 2.minutes do
  # command "/usr/bin/some_great_command"
  runner "Rate.new_rate"
#   rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
