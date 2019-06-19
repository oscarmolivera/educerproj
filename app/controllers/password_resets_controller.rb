class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: params[:password_reset][t(:email)].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t(:info_pr_flash)
      redirect_to new_password_reset_url
    else  
      flash.now[:danger] = t(:danger_pr_flash)
      render 'new'
    end
  end

 def update
    if params[:user][:password].empty?                 
      @user.errors.add(:password, t(:empty_pass))
      render 'edit'
    elsif @user.update_attributes(user_params)          
      log_in @user
      flash[:success] = t(:success_pass)
      redirect_to @user
    else
      render 'edit'                                     
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user      
      unless (@user && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
end
