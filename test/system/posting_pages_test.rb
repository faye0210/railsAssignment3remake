require "application_system_test_case"

class PostingPagesTest < ApplicationSystemTestCase
  setup do
    @posting_page = posting_pages(:one)
  end

  test "visiting the index" do
    visit posting_pages_url
    assert_selector "h1", text: "Posting Pages"
  end

  test "creating a Posting page" do
    visit posting_pages_url
    click_on "New Posting Page"

    fill_in "Content", with: @posting_page.content
    click_on "Create Posting page"

    assert_text "Posting page was successfully created"
    click_on "Back"
  end

  test "updating a Posting page" do
    visit posting_pages_url
    click_on "Edit", match: :first

    fill_in "Content", with: @posting_page.content
    click_on "Update Posting page"

    assert_text "Posting page was successfully updated"
    click_on "Back"
  end

  test "destroying a Posting page" do
    visit posting_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posting page was successfully destroyed"
  end
end
