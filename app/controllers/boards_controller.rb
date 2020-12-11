class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @boards = Board.create
  end


end
