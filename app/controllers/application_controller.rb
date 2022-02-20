class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

 def set_current_user
  @current_user = Customer.find_by(id: session[:customer.id])
 end

 def autheniticate_user
  if @current_user == nil
   redirect_to(new_customer_session_path)
  end
 end

  def after_sign_in_path_for(resource)
    public_customers_my_page_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
