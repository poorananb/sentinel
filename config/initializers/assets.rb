# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


Rails.application.config.assets.precompile += %w( radial-progress-chart.js )
Rails.application.config.assets.precompile += %w( ng-file-upload-all.js )
Rails.application.config.assets.precompile += %w( font-awesome.css )
Rails.application.config.assets.precompile += %w( angular-gridster.min.css )
Rails.application.config.assets.precompile += %w( dashboardstyle.css )
Rails.application.config.assets.precompile += %w( nv.d3.css )
Rails.application.config.assets.precompile += %w( d3.min.js )
Rails.application.config.assets.precompile += %w( ui-bootstrap-tpls.min.js )
Rails.application.config.assets.precompile += %w( angular-nvd3.js )
Rails.application.config.assets.precompile += %w( nv.d3.js )
Rails.application.config.assets.precompile += %w( lineChart.js )
Rails.application.config.assets.precompile += %w( cumulativeLineChart.js )
Rails.application.config.assets.precompile += %w( stackedAreaChart.js )
Rails.application.config.assets.precompile += %w( angular-gridster.js )
Rails.application.config.assets.precompile += %w( ui-bootstrap-tpls.min.js )
Rails.application.config.assets.precompile += %w( common.js )

@time_zone = Setting.fetchAttribute('time_zone')
Time.zone = @time_zone
