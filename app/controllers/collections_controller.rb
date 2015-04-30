class CollectionsController < ApplicationController

  before_action :set_user
  before_action :require_same_user
  before_action :set_collection, only: [:show, :edit]

  def index
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = @user.collections.build(collection_params)
    @collection.users << @user

    if @collection.save
      flash[:notice] = "Collection created."
      redirect_to user_collections_path
    else
      flash[:error] = "Error creating collection."
      render :new
    end
  end

  def show
    @album = Album.new
  end

  def edit
  end

  private

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_collection
      @collection = @user.collections.find_by(id: params[:id])
    end

    def collection_params
      params.require(:collection).permit(:name, :description)
    end

    def require_same_user
      access_denied if current_user != @user
    end

end
