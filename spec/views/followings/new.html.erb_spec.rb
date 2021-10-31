require 'rails_helper'

RSpec.describe "followings/new", type: :view do
  before(:each) do
    assign(:following, Following.new())
  end

  it "renders new following form" do
    render

    assert_select "form[action=?][method=?]", followings_path, "post" do
    end
  end
end
