class TasksController < ApplicationController

    before_action :authenticate_user!

    def new
        @board = Board.find(params[:board_id])
        @task = @board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
            redirect_to board_path(board), notice: 'cardを保存できました'
        else
            flash.now[:error] = 'cardを保存できませんでした'
            render :new
        end
    end

    def show
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
    end

    def edit
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(board_id: @board.id, id: @task.id), notice: 'cardを更新できました'
        else
            flash.now[:error] = 'cardを更新できませんでした'
            render :edit
        end
    end



    def destroy
        board = Board.find(params[:board_id])
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to board_path(board), notice: 'cardを削除しました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :deadline).merge(user_id: current_user.id)
    end

end