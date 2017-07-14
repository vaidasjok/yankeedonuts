class GalleriesController < ApplicationController
  before_action :admin_user

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.save
    redirect_to '/galleries'
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Galerija buvo sėkmingai ištrinta.' }
      format.json { head :no_content }
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        format.html { redirect_to galleries_path, notice: 'Galerija buvo sėkmingai pakoreguota.' }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end


private

def gallery_params
  params.require(:gallery).permit(:title, :id)
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
