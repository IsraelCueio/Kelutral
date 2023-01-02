class ExpressionsController < ApplicationController
  before_action :set_expression, only: %i[ show edit update destroy ]

  # GET /expressions or /expressions.json
  def index
    @expressions = Expression.all
    @phrases = Phrase.all
    @words = Word.all
  end

  # GET /expressions/1 or /expressions/1.json
  def show
    @expressions = Expression.all
    @phrases = Phrase.all
    @words = Word.all
  end

  # GET /expressions/new
  def new
    @words_JSON = Word.all
    @phrases_JSON = Phrase.all
    @expression = Expression.new
    @expression.build_phrase
    @expression.build_word
    @phrases = Phrase.all
    @words = Word.all
  end

  # GET /expressions/1/edit
  def edit
  end

  # POST /expressions or /expressions.json
  def create
    data = JSON.parse(params[:expression][:word_json])

    data.each do |attributes|
      Expression.create(attributes)
    end

    redirect_to expressions_url
    
      #@expression = Expression.new(expression_params)
      #respond_to do |format|
      #  if @expression.save
      #    format.html { redirect_to expressions_url, notice: "Expression was successfully created." }
      #    format.json { render :show, status: :created, location: @expression }
      #  else
      #    format.html { render :new, status: :unprocessable_entity }
      #    format.json { render json: @expression.errors, status: :unprocessable_entity }
      #  end
      #end
    
  end

  # PATCH/PUT /expressions/1 or /expressions/1.json
  def update
    respond_to do |format|
      if @expression.update(expression_params)
        format.html { redirect_to expression_url(@expression), notice: "Expression was successfully updated." }
        format.json { render :show, status: :ok, location: @expression }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expressions/1 or /expressions/1.json
  def destroy
    @expression.destroy

    respond_to do |format|
      format.html { redirect_to expressions_url, notice: "Expression was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expression
      @expression = Expression.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expression_params
      params.permit(expression: [:word_json], phrase_attributes: [:difficulty, :audio, :text], word_attributes: [:name, :audio, :word_class_id]).require(:expression)
    end
end
