# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

# require 'bubble-wrap'

Motion::Project::App.setup do |app|

  app.name = 'yHelp'
  app.identifier = 'com.your_domain_here.yhelp'
  app.short_version = '0.1.0'
  app.version = app.short_version

  #app.sdk_version = '7.1'
  app.deployment_target = '7.0'
  # Or for iOS 6
  #app.sdk_version = '6.1'
  #app.deployment_target = '6.0'

  #app.icons = ["icon@2x.png", "icon-29@2x.png", "icon-40@2x.png", "icon-60@2x.png", "icon-76@2x.png", "icon-512@2x.png"]

  # prerendered_icon is only needed in iOS 6
  #app.prerendered_icon = true

  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait]
  app.frameworks += ['QuartzCore', 'CoreLocation', 'MessageUI', 'KeyboardManager']
  app.prerendered_icon = true
  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))
  app.info_plist["NSLocationWhenInUseUsageDescription"] = "Location is required to find out where you are"
  app.info_plist["NSLocationAlwaysUsageDescription"] = "always want to find the location"
  # app.pods do 
  #     pod 'IQKeyboardManager'
  #   end
  # Use `rake config' to see complete project settings, here are some examples:
  #
  # app.fonts = ['Oswald-Regular.ttf', 'FontAwesome.otf'] # These go in /resources
  # app.frameworks += %w(QuartzCore CoreGraphics MediaPlayer MessageUI CoreData)
  #
  # app.vendor_project('vendor/Flurry', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc
  #
  # app.pods do
  #   pod 'AFNetworking'
  #   pod 'SVProgressHUD'
  #   pod 'JMImageCache'
  # end
 
end
task :"build:simulator" => :"schema:build"