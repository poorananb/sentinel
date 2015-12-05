class Job < ActiveRecord::Base
    validates :job_code, presence: true 
    validates :org_code, presence: true
    validates :client_code, presence: true
    validates :name, presence: true
    
    def self.isJobCodeExists(params)
        @result = Job.where('job_code = ? and org_code = ?', params['job_code'], params['org_code'])
        return @result
    end
end
