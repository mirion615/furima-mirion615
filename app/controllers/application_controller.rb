class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: :new

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana,
                                             :birth_date])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, _password|
      username == ENV['BASIC_AUTH_USER'] && ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
