class CollectionsController < ApplicationController

  before_action :set_user
  before_action :require_user
  before_action :require_same_user
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = @user.collections.build(collection_params)

    if @collection.save
      @collection.users << @user
      flash[:notice] = "Collection created."
      redirect_to user_collections_path
    else
      render :new
    end
  end

  def show
    @album = Album.new
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      flash[:notice] = "Collection updated."
      redirect_to user_collection_path(@user, @collection)
    else
      render :edit
    end
  end

  def destroy
    if @collection.destroy
      flash[:notice] = "Collection deleted."
    else
      flash[:error] = "Could not delete collection."
    end
    redirect_to user_collections_path
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

end
