
  before_action :set_user, only: %i[edit update show]
  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t(:welcome)
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user}
        flash.now[:success] = t(:user_update)
      else
        flash.now[:danger] = t(:user_update_error)
        format.html { render :show}

      end
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

end
