class Index < ActiveRecord::Base
    validates :job_code, presence: true 
    validates :realm_code, presence: true
    validates :cron, presence: true 
    validates :critical, presence: true
    validates :notify, presence: true 
    validates :jobkey, presence: true
    validates :run_length, presence: true, :numericality => {:only_integer => true}
    validates :success_step, presence: true
    
    def self.buildCron(params)
        @cron = params['cron_min'] + ' ' + params['cron_hour'] + ' ' + params['cron_day'] + ' ' + params['cron_month'] + ' ' + params['cron_week']
        return @cron;
    end
end
