require "test_helper"

class WordClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_class = word_classes(:one)
  end

  test "should get index" do
    get word_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_word_class_url
    assert_response :success
  end

  test "should create word_class" do
    assert_difference("WordClass.count") do
      post word_classes_url, params: { word_class: { name: @word_class.name } }
    end

    assert_redirected_to word_class_url(WordClass.last)
  end

  test "should show word_class" do
    get word_class_url(@word_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_class_url(@word_class)
    assert_response :success
  end

  test "should update word_class" do
    patch word_class_url(@word_class), params: { word_class: { name: @word_class.name } }
    assert_redirected_to word_class_url(@word_class)
  end

  test "should destroy word_class" do
    assert_difference("WordClass.count", -1) do
      delete word_class_url(@word_class)
    end

    assert_redirected_to word_classes_url
  end
end
