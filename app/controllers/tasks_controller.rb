class TasksController < ApplicationController
  
   before_filter :get_task, only: [:edit, :update, :destroy]

    def get_task
        @task = Task.find(params[:id])
    end

    def index
        @tasks =  Task.search(params[:search])
    end

    def new
    end

    def create
        @task = Task.new
        if params[:task][:title] == params[:task][:title].upcase
            @task.title = params[:task][:title]
        else
            @task.title = params[:task][:title].capitalize
        end
        @task.description = params[:task][:description]
        @task.save

        redirect_to tasks_path
    end

    def destroy
        @task.destroy
        redirect_to(tasks_path)
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        # @task = Task.find(params[:id])
        @task.title = params[:task][:title]
        @task.description = params[:task][:description]
        @task.save

        redirect_to tasks_path
    end

    def show
        @task = Task.find(params[:id])
    end
end
