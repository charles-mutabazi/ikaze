# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
run Rails.application
