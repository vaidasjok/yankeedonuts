class PhotosController < ApplicationController
  before_action :admin_user

  def index
    @photos = Photo.includes(:gallery).all
    @galleries = Gallery.includes(:photos).all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if (@photo.save)
      redirect_to '/photos'
    else
      redirect_to '/photos/new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Nuotrauka buvo sėkmingai ištrinta.' }
      format.json { head :no_content }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to photos_path, notice: 'Nuotrauka buvo sėkmingai pakoreguota.' }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


private

def photo_params
  params.require(:photo).permit(:title, :id, :gallery_id, :image)
end

# Confirms a logged-in user.
def logged_in_user
  unless logged_in?
    store_location
    flash[:danger] = "Prašome prisijungti."
    redirect_to login_url
  end
end

# Confirms the correct user.
def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless @user == current_user
end

# Confirms an admin user.
def admin_user
  redirect_to(root_url) unless current_user.admin?
end

end
