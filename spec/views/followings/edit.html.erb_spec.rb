require 'rails_helper'

RSpec.describe "followings/edit", type: :view do
  before(:each) do
    @following = assign(:following, Following.create!())
  end

  it "renders the edit following form" do
    render

    assert_select "form[action=?][method=?]", following_path(@following), "post" do
    end
  end
end
