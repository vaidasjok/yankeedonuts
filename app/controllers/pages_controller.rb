class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]
  before_action :admin_user, except: [:show_pages, :send_mail]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find_by_slug(params[:slug])
  end

  def show_pages
    if (params[:slug] == 'logout')
      log_out
      redirect_to '/'
    else
      @page = Page.find_by_slug(params[:slug])
      @galleries = Gallery.includes(:photos).references(:photos).where("galleries.id = photos.gallery_id")
      @products = Product.all
      @categories = ProductCategory.includes(:products)
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def send_mail
    email = params[:email]
    phone = params[:phone]
    subject = params[:subject]
    message = params[:message]

    if(email == '' || phone == '' || message == '')
      redirect_to '/kontaktai', :flash => { :error => "Laukai \"El. pašto adresas\", \"Telefono numeris\" ir \"Žinutė\" negali būti tušti."}
    else
      UserMailer.user_mail(email, phone, subject, message).deliver_now
      redirect_to '/kontaktai', notice: "Jūsų žinutė sėkmingai išsiūsta."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by_slug(params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :slug, :position, :parent, :description, :seo_title, :seo_description, :menu, :gallery, :catalog)
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
