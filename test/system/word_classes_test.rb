require "application_system_test_case"

class WordClassesTest < ApplicationSystemTestCase
  setup do
    @word_class = word_classes(:one)
  end

  test "visiting the index" do
    visit word_classes_url
    assert_selector "h1", text: "Word classes"
  end

  test "should create word class" do
    visit word_classes_url
    click_on "New word class"

    fill_in "Name", with: @word_class.name
    click_on "Create Word class"

    assert_text "Word class was successfully created"
    click_on "Back"
  end

  test "should update Word class" do
    visit word_class_url(@word_class)
    click_on "Edit this word class", match: :first

    fill_in "Name", with: @word_class.name
    click_on "Update Word class"

    assert_text "Word class was successfully updated"
    click_on "Back"
  end

  test "should destroy Word class" do
    visit word_class_url(@word_class)
    click_on "Destroy this word class", match: :first

    assert_text "Word class was successfully destroyed"
  end
end
