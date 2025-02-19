class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  def signin
    # Display the sign-in/sign-up page
  end

  def login
    # Check if the user exists and sign them in
    user = User.find_by(email: params[:email])

    if user
      if user.password == params[:password]
        flash[:success] = 'Successfully signed in!'
      redirect_to user_path(user.id)
      else
        flash[:alert] = 'Invalid password'
        redirect_to signin_path
      end
    else
      flash[:alert] = 'Can\'t find your account, please sign up!'
      redirect_to signin_path
    end
  end

  def guest_login
    # Check if the Guest account exists
    user = User.find_by(email: "guest@xyz.com")
  
    if user
      # Reuse your existing 'login' method with Guest credentials
      params[:email] = "guest@xyz.com"
      params[:password] = "guestpassword"
      login
    else
      # Reuse your existing 'create' method to create a Guest account
      params[:user] = { username: "Guest", email: "guest@xyz.com", password: "guestpassword" }
      create
    end
  end  

  def signup
    # Display the sign-up page
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      @user.create_game_history
      # Successfully created the user, redirect to their profile
      flash[:success] = 'Successfully Logged In!'
      redirect_to user_path(@user)
    else
      # Handle validation errors
      flash[:alert] = 'Failed to create the user'
      redirect_to signup_path
    end
  end

  # GET /users/1 or /users/1.json
  def show
    # Display the user's information based on the provided ID
    @user = User.find(params[:id])
    session[:user_id] = @user.id
  end

  def signout
    # Sign the user out and redirect to sign-in page
    flash[:success] = 'Successfully Logged Out!'
    redirect_to signin_path
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    flash[:success] = 'User Deleted!'
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :username)
    end
end
