require "application_system_test_case"

class ExpressionsTest < ApplicationSystemTestCase
  setup do
    @expression = expressions(:one)
  end

  test "visiting the index" do
    visit expressions_url
    assert_selector "h1", text: "Expressions"
  end

  test "should create expression" do
    visit expressions_url
    click_on "New expression"

    click_on "Create Expression"

    assert_text "Expression was successfully created"
    click_on "Back"
  end

  test "should update Expression" do
    visit expression_url(@expression)
    click_on "Edit this expression", match: :first

    click_on "Update Expression"

    assert_text "Expression was successfully updated"
    click_on "Back"
  end

  test "should destroy Expression" do
    visit expression_url(@expression)
    click_on "Destroy this expression", match: :first

    assert_text "Expression was successfully destroyed"
  end
end
