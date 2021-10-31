require 'rails_helper'

RSpec.describe "followings/index", type: :view do
  before(:each) do
    assign(:followings, [
      Following.create!(),
      Following.create!()
    ])
  end

  it "renders a list of followings" do
    render
  end
end
