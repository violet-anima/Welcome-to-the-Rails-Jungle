class Admin::BaseController < ApplicationController
  before_action :authenticate_admin

  protected

    def authenticate_admin
      authenticate_or_request_with_http_basic do |name, password|
          name == ENV['ADMIN_BASIC_AUTH_NAME'] && password == ENV['ADMIN_BASIC_AUTH_PASSWORD']
      end
    end
end