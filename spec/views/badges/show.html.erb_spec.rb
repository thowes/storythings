require 'spec_helper'

describe "badges/show" do
  before(:each) do
    @badge = assign(:badge, stub_model(Badge,
      :name => "Name",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Picture/)
  end
end
