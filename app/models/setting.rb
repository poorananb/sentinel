class Setting < ActiveRecord::Base
    def self.saveSettings(setting_params)
        begin
            setting_params.each do |key, value|
                if(key!='format' && key != 'controller' && key !='action')
                    @existingSetting = Setting.find_by(key: key)
                    if(!@existingSetting.blank?)
                        @existingSetting.update_attributes(key: key, value: value)
                        @existingSetting.save
                    else
                        @setting = Setting.new(key: key, value: value)
                        @setting.save
                    end
                end
            end
            return true
        rescue => ex
            return ex.message
        end
        
        return false
    end
end
