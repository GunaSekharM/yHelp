# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require 'bundler'
Bundler.require
require 'bubble-wrap/location'
require 'bubble-wrap/sms'

Motion::Project::App.setup do |app|
  app.name = 'yHelp'
  app.identifier = 'com.your_domain_here.yhelp'
  app.short_version = '0.1.0'
  app.version = app.short_version
  app.deployment_target = '7.0'
  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait]
  app.frameworks += ['CoreLocation']
  app.prerendered_icon = true
  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))
end
task :"build:simulator" => :"schema:build"
