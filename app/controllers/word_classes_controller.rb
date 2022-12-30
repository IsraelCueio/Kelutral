class WordClassesController < ApplicationController
  before_action :set_word_class, only: %i[ show edit update destroy ]

  def stop_destroy
    if WordClass.id == 0
      errors.add(:base, :undestroyable)
      throw :abort
      respond_to do |format|
        format.html { redirect_to word_classes_url, notice: "This class can't be deleted." }
        format.json { head :no_content }
      end
    end
  end

  def stop_update
    if WordClass.id == 0
      errors.add(:word_class, :undestroyable)
      throw :abort
      respond_to do |format|
        format.html { redirect_to word_classes_url, notice: "This class can't be edited." }
        format.json { head :no_content }
      end
    end
  end

  # GET /word_classes or /word_classes.json
  def index
    @word_classes = WordClass.all
  end

  # GET /word_classes/1 or /word_classes/1.json
  def show
  end

  # GET /word_classes/new
  def new
    @word_class = WordClass.new
  end

  # GET /word_classes/1/edit
  def edit
  end

  # POST /word_classes or /word_classes.json
  def create
    @word_class = WordClass.new(word_class_params)

    respond_to do |format|
      if @word_class.save
        format.html { redirect_to word_class_url(@word_class), notice: "Word class was successfully created." }
        format.json { render :show, status: :created, location: @word_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_classes/1 or /word_classes/1.json
  def update
    if @word_class.id != 0
      respond_to do |format|
        if @word_class.update(word_class_params)
          format.html { redirect_to word_class_url(@word_class), notice: "Word class was successfully updated." }
          format.json { render :show, status: :ok, location: @word_class }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @word_class.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to word_classes_url, notice: "This class can't be edited" }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /word_classes/1 or /word_classes/1.json
  def destroy
    @word_class.destroy

    if @word_class.id == 0
      
      respond_to do |format|
        format.html { redirect_to word_classes_url, notice: "This class can't be deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to word_classes_url, notice: "Word class was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_class
      @word_class = WordClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_class_params
      params.require(:word_class).permit(:name)
    end
end
