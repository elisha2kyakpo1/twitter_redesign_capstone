require 'rails_helper'

RSpec.describe "followings/show", type: :view do
  before(:each) do
    @following = assign(:following, Following.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
