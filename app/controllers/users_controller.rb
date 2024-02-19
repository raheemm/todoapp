class UsersController < ApplicationController 

    def new
        @user = User.new 
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