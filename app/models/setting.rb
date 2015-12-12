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
end
