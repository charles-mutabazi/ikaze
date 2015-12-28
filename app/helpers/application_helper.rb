module ApplicationHelper

  def flash_class(flash_type)
    { success: 'alert alert-success',
      error:   'alert alert-danger',
      alert:   'alert alert-danger',
      notice:  'alert alert-info',
      error_explanation: 'alert alert-danger'
    }[flash_type.to_sym] || flash_type.to_s
  end


  # helper_method :resource_name, :resource, :devise_mapping
  # Below to to make sure devise forms work anywhere in the application....

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
