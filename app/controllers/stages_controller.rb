class StagesController < ApplicationController
  before_action :set_stage, only: %i[ show edit update destroy ]
  before_action :admin_user

  # GET /stages or /stages.json
  def index
    @stages = Stage.all
  end

  # GET /stages/1 or /stages/1.json
  def show
  end

  # GET /stages/new
  def new
    @stage = Stage.new
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages or /stages.json
  def create
    @stage = Stage.new(stage_params)
    @stage.challenge_file.attach(stage_params[:challenge_file])

    respond_to do |format|
      if @stage.save
        format.html { redirect_to job_path(params["stage"][:job_id]), notice: "Stage was successfully created." }
        format.json { render :show, status: :created, location: @stage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stages/1 or /stages/1.json
  def update
    respond_to do |format|
      @stage.challenge_file.attach(stage_params[:challenge_file])
      if @stage.update(stage_params)
        format.html { redirect_to stage_url(@stage), notice: "Stage was successfully updated." }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1 or /stages/1.json
  def destroy
    @job_id =  @stage.job.id
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to job_path(@job_id), notice: "Stage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stage_params
      params.require(:stage).permit(:name, :job_id, :challenge_file)
    end
end
