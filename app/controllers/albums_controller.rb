class AlbumsController < ApplicationController

  before_action :set_user, only: [:destroy]
  before_action :require_same_user, only: [:destroy]
  before_action :set_album, only: [:edit, :update]
  before_action :set_collection, only: [:create, :edit, :update]

  def create
    @album = @collection.albums.build(album_params)

    respond_to do |format|
      if @album.save
        @collection.albums << @album
        format.js
        format.html do
          flash[:notice] = "Album added to collection."
          redirect_to user_collection_path(current_user.id, @collection)
        end
      else
        format.html do
          @collection.albums.reload
          render 'collections/show'
        end
      end
    end
  end

  def edit
    render 'collections/show'
  end

  def update
    if @album.update(album_params)
      flash[:notice] = "Album updated."
      redirect_to user_collection_path(current_user.id, @collection)
    else
      render 'collections/show'
    end
  end

  def destroy
    album = Album.find(params[:id])
    if album
      album.destroy
      flash[:notice] = "Album removed from collection."
      redirect_to :back
    else
      flash[:error] = "Could not remove album."
      render 'collections/show'
    end
  end

  private

    def album_params
      params.require(:album).permit(:title, :artist, :release_year, :catalog_number, :record_label)
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    def set_user
      @user = User.find(session[:user_id])
    end

end
