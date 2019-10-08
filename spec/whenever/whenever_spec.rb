require "rails_helper"

describe 'Whenever Schedule' do
  let(:schedule){ Whenever::Test::Schedule.new(file: 'config/schedule.rb') }

  it 'makes sure `runner` statements exist' do
    assert_equal 1, schedule.jobs[:runner].count

    # Executes the actual ruby statement to make sure all constants and methods exist:
    schedule.jobs[:runner].each { |job| instance_eval job[:task] }
  end

  it 'makes sure cron alive monitor is registered in 2 minutes basis' do
    assert_equal 'Rate.new_rate', schedule.jobs[:runner].first[:task]
    assert_equal "cd :path && :bundle_command rails runner -e :environment ':task' :output", schedule.jobs[:runner].first[:command]
    assert_equal "[2 minutes]", schedule.jobs[:runner].first[:every].to_s
  end
end