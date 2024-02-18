class TasksController < ApplicationController 

    def index
        @tasks = Task.all 
    end 

    def show
        @tasks = Task.all
    end 

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to @task
    end 

    def done
        @task = Task.find(params[:id])
        @task.update(status: 'true')
        redirect_to @task
    end 

    def undo
        @task = Task.find(params[:id])
        @task.update(status: 'false')
        redirect_to @task
    end 

    def new
        @task = Task.new
    end 

    def edit
        @task = Task.find(params[:id])
    end 

    def create
        task_params = params.require(:task).permit(:title, :status)
        @task = Task.new(task_params)
        if @task.save
            flash[:notice] = "Task was created"
            redirect_to @task
        else 
            redirect_to 'new'
        end 
    end 

    def update
        @task = Task.find(params[:id])
        task_params = params.require(:task).permit(:title, :status)
        task_params[:status] = task_params[:status] == '1'  

        if @task.update(task_params)
            flash[:notice] = "Tasks updated successfully"
            redirect_to @task
        else 
            render 'edit'
        end 
    end 


end