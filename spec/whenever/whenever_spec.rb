require "rails_helper"

describe 'Whenever Schedule' do
  before do
    load 'Rakefile' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end

  it 'makes sure `runner` statements exist' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

    assert_equal 1, schedule.jobs[:runner].count

    # Executes the actual ruby statement to make sure all constants and methods exist:
    schedule.jobs[:runner].each { |job| instance_eval job[:task] }
  end

  it 'makes sure cron alive monitor is registered in minute basis' do
    schedule = Whenever::Test::Schedule.new(file: fixture)
    p schedule.jobs
    # assert_equal 'http://myapp.com/cron-alive', schedule.jobs[:curl].first[:task]
    # assert_equal 'curl :task', schedule.jobs[:curl].first[:command]
    assert_equal [:minute], schedule.jobs[:runner].first[:every]
  end
end