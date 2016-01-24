# file: app/mailers/job_mailer.rb
class JobMailer < ActionMailer::Base
  require 'date'
  
  def check_job_running_status(options)
    @indices = Index.all
    
    @indices.each do |index|
        @cron = ''
        @cron = index.cron
        @jobkey = index.jobkey
        @mins = index.run_length
        cron_parser = CronParser.new(@cron)
        @last_cron = cron_parser.last(Time.now) #.in_time_zone(Time.zone.name)
        @next_cron = cron_parser.next(Time.now.in_time_zone(Time.zone.name))
        
        @runs = Run.where(["jobkey = ? and created_at = ?, value != ?", @jobkey, @last_cron, 'done']).limit(1)
        
        if(!@runs.blank?)
          @runs.each do |run|
            created_at = run.created_at
            
            created_at2 = created_at.in_time_zone(Time.zone.name)
            minutes = (Time.now - created_at2) + 10
            
            if(minutes > @mins)
              #send mail
            end
            
            Rails.logger.debug("My password: #{@last_cron}")
          end
        else
          run = Run.new(jobkey: @jobkey, stage: 'mia', value: 'missing_in_action')
          run.save()
        end
    end
  end
end