# file: app/mailers/job_mailer.rb
class JobMailer < ActionMailer::Base
  def check_job_running_status(options)
    @indices = Index.all
    
    @indices.each do |index|
        @cron = ''
        @cron = index.cron
        
        cron_parser = CronParser.new(@cron)
        time_zone = Setting.fetchAttribute('time_zone')
        next_comming_time = cron_parser.next(Time.now.in_time_zone(Time.zone.name))
        
        Rails.logger.debug("My password: #{next_comming_time}")
    end
    #Time.now.in_time_zone("Asia/Singapore")
  end
end