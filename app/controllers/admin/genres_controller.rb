class Admin::GenresController < ApplicationController
  
  def create
    @genre = Genre.new(genre_params)
    @genre.admin_id = currrent_admin.id
    @genre.save!
    redirect_to admin_genres_path
  end
  
  def index
    @genre = Genre.new
  end

  def edit
  end
  
   private
  def genre_params
    params.require(:genre).permit(:name)
  end
end