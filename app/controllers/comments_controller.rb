class CommentsController < ApplicationController
    def new
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        if @comment.save
            redirect_to board_task_path(board_id: @board.id, id: task.id), notice: 'Comment saved.'
        else
            flash.now[:error] = 'Comment not saved.'
            render :new
        end
    end

    def comment_params
        params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end
end
