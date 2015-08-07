class WritingsController < ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]

  def index
    @writings = Writing.paginate(page: params[:page])
  end

  # GET /writings/1
  # GET /writings/1.json
  def show
  end

  # GET /writings/new
  def new
    @writing = Writing.new
  end

  # GET /writings/1/edit
  def edit
  end

  # POST /writings
  # POST /writings.json
  def create
    @writing = current_user.writings.build(writing_params)
    if @writing.save
        redirect_to writings_url
    else
    	render 'new'
    end
  end

  # PATCH/PUT /writings/1
  # PATCH/PUT /writings/1.json
  def update
    flash[:success] = "Writing updated"
    redirect_to @writing
  end

  # DELETE /writings/1
  # DELETE /writings/1.json
  def destroy
    @writing.destroy
    flash[:success] = "User deleted"
    redirect_to writings_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writing
      @writing = Writing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def writing_params
      params.require(:writing).permit(:title, :writing_type, :content, :user_id, :comments_count)
    end
end
