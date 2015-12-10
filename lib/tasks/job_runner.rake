desc 'job runner check'
task job_runner_check: :environment do
    options = [];
    JobMailer.check_job_running_status(options).deliver_now!
end