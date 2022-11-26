require "test_helper"

class PhraseTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phrase_translation = phrase_translations(:one)
  end

  test "should get index" do
    get phrase_translations_url
    assert_response :success
  end

  test "should get new" do
    get new_phrase_translation_url
    assert_response :success
  end

  test "should create phrase_translation" do
    assert_difference("PhraseTranslation.count") do
      post phrase_translations_url, params: { phrase_translation: {  } }
    end

    assert_redirected_to phrase_translation_url(PhraseTranslation.last)
  end

  test "should show phrase_translation" do
    get phrase_translation_url(@phrase_translation)
    assert_response :success
  end

  test "should get edit" do
    get edit_phrase_translation_url(@phrase_translation)
    assert_response :success
  end

  test "should update phrase_translation" do
    patch phrase_translation_url(@phrase_translation), params: { phrase_translation: {  } }
    assert_redirected_to phrase_translation_url(@phrase_translation)
  end

  test "should destroy phrase_translation" do
    assert_difference("PhraseTranslation.count", -1) do
      delete phrase_translation_url(@phrase_translation)
    end

    assert_redirected_to phrase_translations_url
  end
end
