class ListsController < ApplicationController

    before_action :set_list, only: [:show, :edit, :update, :destroy]


    def index
        @lists = List.all
    end


    def show; end

  def new
    @lists = List.new
  end

  def create
    @lists = List.new(lists_params)
    @lists.save

    redirect_to lists_path(@lists)
  end

  def edit; end

  def update
    @lists.update(lists_params)

    redirect_to lists_path(@lists)
  end

  def destroy
    @lists = List.bookmark.find(params[:id])
    @lists.destroy

    redirect_to @pokemon.trainer
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
