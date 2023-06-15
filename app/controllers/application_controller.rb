class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_render_order
  before_action :initialize_order

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def set_render_order
    @render_order = true
  end

  def initialize_order
    @order ||= Order.find_by(id: session[:order_id], user_id: current_user.id) if current_user

    return unless @order.nil?

    @order = Order.new(number: SecureRandom.hex(4), delivery_time: 'time', confirmed: false)
    @order.user = current_user
    @order.save
    session[:order_id] = @order.id
  end
end
