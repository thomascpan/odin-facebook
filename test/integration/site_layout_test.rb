require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do 
  	get root_path
  	assert_template 'users/registrations/new'
  	assert_select "a[href=?]", root_path
  	assert_select "tr", 3
  	assert_select "td", 10
  end
end