class PhraseTranslationsController < ApplicationController
  before_action :set_phrase_translation, only: %i[ show edit update destroy ]

  # GET /phrase_translations or /phrase_translations.json
  def index
    @phrase_translations = PhraseTranslation.all
  end

  # GET /phrase_translations/1 or /phrase_translations/1.json
  def show
  end

  # GET /phrase_translations/new
  def new
    @phrase_translation = PhraseTranslation.new
  end

  # GET /phrase_translations/1/edit
  def edit
  end

  # POST /phrase_translations or /phrase_translations.json
  def create
    @phrase_translation = PhraseTranslation.new(phrase_translation_params)

    respond_to do |format|
      if @phrase_translation.save
        format.html { redirect_to phrase_translation_url(@phrase_translation), notice: "Phrase translation was successfully created." }
        format.json { render :show, status: :created, location: @phrase_translation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phrase_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrase_translations/1 or /phrase_translations/1.json
  def update
    respond_to do |format|
      if @phrase_translation.update(phrase_translation_params)
        format.html { redirect_to phrase_translation_url(@phrase_translation), notice: "Phrase translation was successfully updated." }
        format.json { render :show, status: :ok, location: @phrase_translation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phrase_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrase_translations/1 or /phrase_translations/1.json
  def destroy
    @phrase_translation.destroy

    respond_to do |format|
      format.html { redirect_to phrase_translations_url, notice: "Phrase translation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase_translation
      @phrase_translation = PhraseTranslation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrase_translation_params
      params.require(:phrase_translation).permit(:translation, :phrase_id)
    end
end
