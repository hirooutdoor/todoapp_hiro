class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.create
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end

end
