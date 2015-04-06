# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require './lib/api'
require './lib/api/role'
require './lib/api/user'
require './lib/api/appointment'
require './lib/api/terminal'
require './lib/api/terminal_record'
require './lib/api/guardian'
require './lib/api/patient'
require './lib/api/patient_record'
require './lib/api/patient_service'
require './lib/api/complaint'
run Project::API.new
#run Rails.application
