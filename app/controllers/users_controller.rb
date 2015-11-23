class UsersController < ApplicationController
def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)
  end

  def index
		@users = User.all_except(current_user)
		# @count = User.likers_count
		# @likes_num = @user.likes.count
		# @user.likers_count
  end

  def likers 
  	@count = User.likers_count
  end

  def acts_as_likeable
  	@count = User.likers_count
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     flash[:success] = "Welcome to the Feeling Lucky!"
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def likees_count
  	@user.likees_count
  end



  def likes
  	# include Socialization::Liker
  	@user = current_user
  	@other = User.find(params[:id])
  	@user.like!(@other)
  	redirect_to action: "index", notice: "Liked this user successfully!"
  	# redirect_to :users_path, 
  end

   def liked
   	include Socialization::Likeable
   	@user = current_user
   	@other = User.find(params[:id])
   	@user.likers(@other)

  end

  # def likees
  # 	@count = user.likees_count
  # end




  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to :back
  end

  def followers
    @followers = current_user.followers
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :likees_count, :likees_count,
                                   :password_confirmation)
    end
end
