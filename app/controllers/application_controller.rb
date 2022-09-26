class ApplicationController < ActionController::Base
  include Clearance::Controller
  before_action :require_login, except: [:sign_in, :sign_up]
end
