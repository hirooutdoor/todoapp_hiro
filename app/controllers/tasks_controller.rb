class TasksController < ApplicationController

    def new
        @task = current_user.tasks.build
    end
    
    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.new
        @task.save
    end

    def update
    end

    def destroy

    end

end