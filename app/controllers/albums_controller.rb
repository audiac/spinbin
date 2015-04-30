class AlbumsController < ApplicationController

  before_action :require_user
  before_action :set_album, only: [:edit, :update]
  before_action :set_collection, only: [:create, :edit, :update]

  def create
    @album = @collection.albums.build(album_params)

    if @album.save
      @collection.albums << @album
      flash[:notice] = "Album added to collection."
      redirect_to user_collection_path(current_user.id, @collection)
    else
      @collection.albums.reload
      render 'collections/show'
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
    album.destroy
    flash[:notice] = "Album removed from collection."
    redirect_to :back
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

end
