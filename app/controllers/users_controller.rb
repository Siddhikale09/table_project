class UsersController < ApplicationController
def show
@user = User.find(params[:id])
@articles = Article.paginate(page: params[:page], per_page: 3)
end
def index
@user = User.all
@user = User.paginate(page: params[:page], per_page: 3)
end
def new
@user = User.new
end

def edit
@user = User.find(params[:id])
end

def create
@user = User.new(params.require(:user).permit(:username, :email, :password))
if @user.save
    flash[:notice] = 'User created successfully!'
    redirect_to @user
else
    render :new, status: :unprocessable_entity
end
end

def update
@user = User.find(params[:id])
if @user.update(params.require(:user).permit(:username, :email, :password))
flash[:notice] = "your account has been updated successfully!"
redirect_to @user
else
render :edit, status: :unprocessable_entity
end
end

end
