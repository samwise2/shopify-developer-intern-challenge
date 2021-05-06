require "test_helper"

class GraphicTest < ActiveSupport::TestCase
  test "should not save graphic without title" do
    graphic = Graphic.new
    assert_not graphic.save, "Saved the graphic without a title"
  end
  test "should not save graphic without description" do
    graphic = Graphic.new(:title => "Example Title")
    assert_not graphic.save, "Saved the graphic without a description"
  end
  test "should not save graphic without image" do
    graphic = Graphic.new(:title => "Example Title", :description => "This is an image of a thing")
    assert_not graphic.save, "Saved the graphic without a description"
  end
  test "should save graphic with title, description and png" do
    graphic = Graphic.new(:title => "Example Title", :description => "This is an image of a thing")
    path = File.join Rails.root, 'test', 'models'
    graphic.image.attach(io: File.open(File.join(path, 'logo512.png')), filename: 'logo512.png')
    assert graphic.save, "Failed to save normal graphic"
  end
  test "should save graphic with title, description and jpeg" do
    graphic = Graphic.new(:title => "Example Title", :description => "This is an image of a thing")
    path = File.join Rails.root, 'test', 'models'
    graphic.image.attach(io: File.open(File.join(path, 'demo.jpeg')), filename: 'demo.jpeg')
    assert graphic.save, "Failed to save normal graphic"
  end
  test "should not save graphic with non-image formatted file" do
    graphic = Graphic.new(:title => "Example Title", :description => "This is an image of a thing")
    path = File.join Rails.root, 'test', 'models'
    graphic.image.attach(io: File.open(File.join(path, 'ex.pdf')), filename: 'ex.pdf')
    assert_not graphic.save, "Saved graphic with wrong file format"
  end
end
