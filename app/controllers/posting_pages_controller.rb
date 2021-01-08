class PostingPagesController < ApplicationController
  before_action :set_posting_page, only: [:show, :edit, :update, :destroy]

  # GET /posting_pages
  # GET /posting_pages.json
  def index
    @posting_pages = PostingPage.all
  end

  # GET /posting_pages/1
  # GET /posting_pages/1.json
  def show
  end

  # GET /posting_pages/new
  def new
    @posting_page = PostingPage.new
  end

  # GET /posting_pages/1/edit
  def edit
  end

  # POST /posting_pages
  # POST /posting_pages.json
  def create
    @posting_page = PostingPage.new(posting_page_params)

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

  # PATCH/PUT /posting_pages/1
  # PATCH/PUT /posting_pages/1.json
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

  # DELETE /posting_pages/1
  # DELETE /posting_pages/1.json
  def destroy
    @posting_page.destroy
    respond_to do |format|
      format.html { redirect_to posting_pages_url, notice: 'Posting page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting_page
      @posting_page = PostingPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posting_page_params
      params.require(:posting_page).permit(:content)
    end
end
