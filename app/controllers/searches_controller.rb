class SearchesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    # @searches = Search.all
    @resp = Faraday.get 'http://api.amp.active.com/v2/search/' do |req|
      req.params['api_key']='h9tfswkrjjxan2y9z93hqs7f'
      req.params['query']='Distance running'
      req.params['per_page']="3"
      req.params['city']='Cambridge'||params[:city]
      req.params['state']='MA'
      req.params['sort']='date_desc'
      req.params['radius']='15'
    end
  parse_response = JSON.parse(@resp.body)
  @results = parse_response["results"]
  # @hash = Hash.new {|h,k| h[k] = Hash.new(&h.default_proc)}
  # @hash_results = @hash[@results]
  # puts @hash_results
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:city, :Date, :Type)
    end
end
