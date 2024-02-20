class UsersController < ApplicationController 

    def new
        @user = User.new 
    end 

    def index
        @users = User.all 
    end 

    def show
        @user = User.find(params[:id])
        @tasks = @user.tasks
    end 

    def edit
        @user = User.find(params[:id])
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your profile was updated"
            redirect_to tasks_path
        else 
            render 'edit'
        end 
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            flash[:notice] = "Welcome to TodoApp. Your account has been created"
            redirect_to tasks_path
        else 
            render 'new'
        end     
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end 