class AlbumsController < ApplicationController

  before_action :require_user

  def create
    @collection = Collection.find(params[:collection_id])
    @album = @collection.albums.build(album_params)

    if @album.save
      @collection.albums << @album
      flash[:notice] = "Album added to collection."
      redirect_to root_path
    else
      @collection.albums.reload
      render 'collections/show'
    end
  end

  private

    def album_params
      params.require(:album).permit(:title, :artist, :release_year, :catalog_number, :record_label)
    end

end
