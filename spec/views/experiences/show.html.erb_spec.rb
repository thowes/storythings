require 'spec_helper'

describe "experiences/show" do
  before(:each) do
    @experience = assign(:experience, stub_model(Experience))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
