require "test_helper"

class GraphicsControllerTest < ActionDispatch::IntegrationTest
   # called before every single test
  setup do
    @graphic = graphics(:one)
  end

  # called after every single test
  teardown do
    Rails.cache.clear
  end

  test "should show graphic" do
    get graphic_url(@graphic)
    assert_response :success
  end

  test "should create graphic" do
    assert_difference("Graphic.count") do
      image = fixture_file_upload('logo512.png')
      post graphics_url, params: { graphic: { description: "Rails is awesome!", title: "Hello Rails", image: image } }
    end
  
    assert_redirected_to graphic_path(Graphic.last)
  end

  test "should update graphic" do
    patch graphic_url(@graphic), params: { graphic: { title: "updated" } }
    assert_equal "MyString", @graphic.title

    assert_redirected_to graphic_path(@graphic)
    # Reload association to fetch updated data and assert that title is updated.
    @graphic.reload
    assert_equal "updated", @graphic.title
  end

  test "should get index" do
    get graphics_url, params: { search: "MyString" }
    assert_response :success
  end
end
