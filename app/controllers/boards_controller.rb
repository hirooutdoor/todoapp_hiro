class BoardsController < ApplicationController
  def index
    @board = Board.first
  end

  def new
    @board = Board.create
  end

  def edit
  end

end
