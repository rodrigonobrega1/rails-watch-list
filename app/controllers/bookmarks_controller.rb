class BookmarksController < ApplicationController

    before_action :set_list
    before_action :set_bookmark, only: [:edit, :update, :show, :destroy]
    
    def index
        @bookmarks = Bookmark.all
      end
    
      def show;  end

      def edit; end
    
      def new
        @bookmark = Bookmark.new
      end
    
      def create
        @bookmark = Bookmark.new(bookmark_params)
        @bookmark.list = @list
        if @bookmark.save
          redirect_to list_path(@list)
        else
          render :new
        end
      end

      def destroy
        @bookmark.destroy
        redirect_to list_path(@bookmark)
      end
    
      private
    
      def set_list
        @list = List.find(params[:list_id])
      end
    
      def set_bookmark
        @bookmark = Bookmark.find(params[:id])
      end
    
      def bookmark_params
        params.require(:bookmark).permit(:comment, :movie_id, :list_id)
      end
end
