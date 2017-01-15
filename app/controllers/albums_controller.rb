class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new album_params
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.friendly.find params[:id]
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end

end
