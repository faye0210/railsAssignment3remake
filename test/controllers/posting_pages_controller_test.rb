require 'test_helper'

class PostingPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posting_page = posting_pages(:one)
  end

  test "should get index" do
    get posting_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_posting_page_url
    assert_response :success
  end

  test "should create posting_page" do
    assert_difference('PostingPage.count') do
      post posting_pages_url, params: { posting_page: { content: @posting_page.content } }
    end

    assert_redirected_to posting_page_url(PostingPage.last)
  end

  test "should show posting_page" do
    get posting_page_url(@posting_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_posting_page_url(@posting_page)
    assert_response :success
  end

  test "should update posting_page" do
    patch posting_page_url(@posting_page), params: { posting_page: { content: @posting_page.content } }
    assert_redirected_to posting_page_url(@posting_page)
  end

  test "should destroy posting_page" do
    assert_difference('PostingPage.count', -1) do
      delete posting_page_url(@posting_page)
    end

    assert_redirected_to posting_pages_url
  end
end
