class ArtworksController < ApplicationController

  def index
    @artworks_shared = User.find(params[:user_id]).shared_artworks
    @artworks_owned = User.find(params[:user_id]).artworks
    art = {shared: @artworks_shared, owned: @artworks_owned}
    render json: art
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artworks = Artwork.find_by(id: params[:id])
    if @artworks
      render json: @artworks
    else
      render json: ["ID does not exist."], status: 404
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 400
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      render json: artwork
    else
      render json: ['No artwork to destroy'], status: 404
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end


end
