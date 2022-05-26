class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit]
  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ユーザを登録しました。'
      redirect_to '/'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def set_image
      @image = Image.find(params[:id])
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :self_introduction)
  end
  
end
