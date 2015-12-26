class Setting < ActiveRecord::Base
    def self.saveSettings(setting_params)
        begin
            setting_params.each do |key, value|
                if(key!='format' && key != 'controller' && key !='action')
                    @existingSetting = Setting.find_by(key: key)
                    if(!@existingSetting.blank?)
                        option_values = {}
                        if(value.is_a?(Array))
                            value.each do |option_value|
                                option_values[]= option_value
                            end
                            @existingSetting.update_attributes(key: key, value: option_values)
                        else
                            @existingSetting.update_attributes(key: key, value: value)
                        end
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
    
    def self.fetchAttribute(attribute)
        settingObj = Setting.where(:key => attribute).first
        if !settingObj.blank?
            value = settingObj.value
            return value
        else
            self.getDefaultValues(attribute)
        end
    end
    
    def self.getDefaultValues(attribute)
        puts case attribute
        when 'time_zone'
            return Time.zone
        when 'limitofrows'
            return 10
        end
    end
    
    def self.getTimeZone
       Rails.logger.debug("My password: #{'from application' + Time.zone.name}") 
    end
end
