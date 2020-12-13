class TasksController < ApplicationController

    def new
        @task = current_user.tasks.build
    end
    
    def show
        @task = Task.find(params[:id])
    end

    def edit
    end

    def create

    end

    def update

    end

    def destroy

    end

end