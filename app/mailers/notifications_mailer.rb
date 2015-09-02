class NotificationsMailer < ApplicationMailer
  def new_user(user_params)
    mail(
      to:       user_params[:email],
      subject:  "Welcome to Farmers Market, #{user_params[:first_name]}!"
    )
  end

  def new_store(current_user)
    mail(
    to:         current_user.email,
    subject:  "Welcome to Farmers Market, #{current_user.store.farm_name}!"
    ) do |format|
      format.html {
          render locals: { farm_name: current_user.store.farm_name }
        }
    end
  end

  def user_order(current_user)
    mail(
    to:         current_user.email,
    subject:  "Welcome to Farmers Market, #{current_user.store.farm_name}!"
    ) do |format|
      format.html {
          render locals: { user_first_name: current_user.first_name,
                           user_last_name: current_user.last_name}
        }
    end
  end
end
