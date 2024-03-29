class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy ]
  before_action :set_courses, only: %i[ new edit]
  before_action :authorize_user, only: %i[ show edit update destroy ]

  # GET /batches or /batches.json
  def index
    @batches = Batch.all
    authorize @batches

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /batches/1 or /batches/1.json
  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)
    authorize @batch

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy!

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    def set_courses
      @courses = Course.all
    end

    def authorize_user
      authorize @batch
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:name, :start_date, :end_date, :course_id)
    end
end
