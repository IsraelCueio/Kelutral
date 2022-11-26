require "test_helper"

class WordTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_translation = word_translations(:one)
  end

  test "should get index" do
    get word_translations_url
    assert_response :success
  end

  test "should get new" do
    get new_word_translation_url
    assert_response :success
  end

  test "should create word_translation" do
    assert_difference("WordTranslation.count") do
      post word_translations_url, params: { word_translation: {  } }
    end

    assert_redirected_to word_translation_url(WordTranslation.last)
  end

  test "should show word_translation" do
    get word_translation_url(@word_translation)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_translation_url(@word_translation)
    assert_response :success
  end

  test "should update word_translation" do
    patch word_translation_url(@word_translation), params: { word_translation: {  } }
    assert_redirected_to word_translation_url(@word_translation)
  end

  test "should destroy word_translation" do
    assert_difference("WordTranslation.count", -1) do
      delete word_translation_url(@word_translation)
    end

    assert_redirected_to word_translations_url
  end
end
