require "application_system_test_case"

class WordTranslationsTest < ApplicationSystemTestCase
  setup do
    @word_translation = word_translations(:one)
  end

  test "visiting the index" do
    visit word_translations_url
    assert_selector "h1", text: "Word translations"
  end

  test "should create word translation" do
    visit word_translations_url
    click_on "New word translation"

    click_on "Create Word translation"

    assert_text "Word translation was successfully created"
    click_on "Back"
  end

  test "should update Word translation" do
    visit word_translation_url(@word_translation)
    click_on "Edit this word translation", match: :first

    click_on "Update Word translation"

    assert_text "Word translation was successfully updated"
    click_on "Back"
  end

  test "should destroy Word translation" do
    visit word_translation_url(@word_translation)
    click_on "Destroy this word translation", match: :first

    assert_text "Word translation was successfully destroyed"
  end
end
