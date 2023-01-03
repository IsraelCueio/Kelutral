class ExpressionsController < ApplicationController
  before_action :set_expression, only: %i[ show edit update destroy ]

  # GET /expressions or /expressions.json
  def index
    @expressions = Expression.all
    @phrases = Phrase.all
    @words = Word.all
    @phrase_translations = PhraseTranslation.all
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
    
    new_phrase = params[:expression][:text]
    phrase_translation = params[:expression][:translation]
    new_words = JSON.parse(params[:expression][:name])
    difficulty = params[:expression][:difficulty]
    if new_words.any?
      new_words.each do |word|
        @word = Word.new(word)
        @word.save
      end
    end

    new_phrase = {"text" => new_phrase,"difficulty" => difficulty}
    @phrase = Phrase.new(new_phrase)
    @phrase.save


    words_order = []
    words_order = new_phrase["text"].downcase
    words_order = words_order.split(/[^A-zÀ-ú"']/)
    words_order.each_with_index do |term,index|
      words_order[index] = term.gsub(/[^A-zÀ-ú"'\s]/, '')
    end
    words_order = words_order.reject { |w| w.empty?}

    @new_words = []
    words_order.each do |term|
      @new_words.push((Word.all).where(name: term))
    end

    (Phrase.all).each do |phrase|
      if phrase.text == new_phrase["text"]
        @phrase_id = phrase.id
      end
    end

    phrase_translation = {"translation" => phrase_translation.downcase,"phrase_id" => @phrase_id}
    @phrase_translation = PhraseTranslation.new(phrase_translation)
    @phrase_translation.save

    @new_words.each do |word|
      expression_ids = {"word_id"=>word.first.id,"phrase_id"=>@phrase_id}
      @expression = Expression.new(expression_ids)
      @expression.save
    end

    

    respond_to do |format|
      if @expression.save
        format.html { redirect_to expressions_url, notice: "Expression was successfully created." }
        format.json { render :show, status: :created, location: @expression }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
    
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
      params.permit(expression: [:name,:text,:translation,:difficulty]).require(:expression)
    end
end
