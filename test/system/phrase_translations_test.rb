require "application_system_test_case"

class PhraseTranslationsTest < ApplicationSystemTestCase
  setup do
    @phrase_translation = phrase_translations(:one)
  end

  test "visiting the index" do
    visit phrase_translations_url
    assert_selector "h1", text: "Phrase translations"
  end

  test "should create phrase translation" do
    visit phrase_translations_url
    click_on "New phrase translation"

    click_on "Create Phrase translation"

    assert_text "Phrase translation was successfully created"
    click_on "Back"
  end

  test "should update Phrase translation" do
    visit phrase_translation_url(@phrase_translation)
    click_on "Edit this phrase translation", match: :first

    click_on "Update Phrase translation"

    assert_text "Phrase translation was successfully updated"
    click_on "Back"
  end

  test "should destroy Phrase translation" do
    visit phrase_translation_url(@phrase_translation)
    click_on "Destroy this phrase translation", match: :first

    assert_text "Phrase translation was successfully destroyed"
  end
end
