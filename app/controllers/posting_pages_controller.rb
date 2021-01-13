class PostingPagesController < ApplicationController
  before_action :set_posting_page, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posting_pages = PostingPage.all
  end

  def show
    @favourite = current_user.favourites.find_by(posting_page_id: @posting_page.id)
  end

  def new
    if params[:back]
      @posting_page = PostingPage.new(posting_page_params)
    else
      @posting_page = current_user.posting_pages.build
    end
  end

  def edit
  end

  def create
    @posting_page = current_user.posting_pages.build(posting_page_params)
    respond_to do |format|
      if @posting_page.save
        format.html { redirect_to @posting_page, notice: 'Posting page was successfully created.' }
        format.json { render :show, status: :created, location: @posting_page }
      else
        format.html { render :new }
        format.json { render json: @posting_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @posting_page.update(posting_page_params)
        format.html { redirect_to @posting_page, notice: 'Posting page was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting_page }
      else
        format.html { render :edit }
        format.json { render json: @posting_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @posting_page.destroy
    respond_to do |format|
      format.html { redirect_to posting_pages_url, notice: 'Posting page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @posting_page = current_user.posting_pages.build(posting_page_params)
    render :new if @posting_page.invalid?
  end

  private

  def set_posting_page
    @posting_page = PostingPage.find(params[:id])
  end

  def ensure_correct_user
    @posting_page = PostingPage.find(params[:id])
    if @posting_page.user_id != current_user.id
      flash[:notice] = "No authority"
      redirect_to posting_pages_url
    end
  end

  def posting_page_params
    params.require(:posting_page).permit(:content, :image, :image_cache)
  end
end
