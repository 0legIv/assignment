defmodule AssignmentTest do
  use ExUnit.Case
  alias Assignment

  @correct_url1 "https://www.galtreslodge.uk"
  @correct_url2 "https://www.thelionhotelblaenavon.co.uk/"
  @incorrect_url "https://incorrect_url.c"


  test "fetch the pages with correct url" do
    test_img_url = "/assets/template/images/nav.png"
    test_link_url = "https://www.facebook.com/galtreslodgehotelyork"
    page = Assignment.fetch(@correct_url1)
    assert Enum.any?(page.assets, fn img -> img == test_img_url end)
    assert Enum.any?(page.links, fn link -> link == test_link_url end)

    test_img_url = "/media/19817/front-new_Banner Home Desktop.jpg"
    test_link_url = "https://twitter.com/The_Lion_Hotel"
    page = Assignment.fetch(@correct_url2)
    assert Enum.any?(page.assets, fn img -> img == test_img_url end)
    assert Enum.any?(page.links, fn link -> link == test_link_url end)
  end

  test "fetch the page with incorrect url" do
    assert {:error, reason} = Assignment.fetch(@incorrect_url)
  end
end
